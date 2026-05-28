import { computed, ref, toValue, type MaybeRefOrGetter } from "vue";
import { useDictStoreHook } from "@/store";

/**
 * 通用字典选项标签查找函数
 * 在 useDictOptions 的 options computed 已加载后使用
 * @param options - 字典选项列表（来自 useDictOptions().options）
 * @param value - 字典值
 * @returns 字典标签，未找到时返回空字符串
 */
export function getOptionLabel(options: any[], value: string | undefined | null): string {
  if (value == null || value === "") return "";
  const item = options.find((d) => d.dict_value === String(value));
  return item ? item.dict_label : String(value);
}

/**
 * 字典下拉数据加载 composable
 *
 * 基于现有 dictStore 封装，提供响应式字典选项加载能力。
 * 同一 dictType 全局只请求一次（dictStore 内置缓存）。
 *
 * @param dictType - 字典类型编码（如 "customer_type", "customer_level"）
 * @returns { options, loaded, loading, load, ensureLoaded, getLabel }
 *
 * @example
 * ```ts
 * const { options, ensureLoaded } = useDictOptions("customer_type");
 * await ensureLoaded();  // 确保字典已加载
 * // options.value 自动更新
 * ```
 */
export function useDictOptions(dictType: MaybeRefOrGetter<string>) {
  const loading = ref(false);
  const loaded = ref(false);

  const dictStore = useDictStoreHook();

  /** 响应式字典选项列表 */
  const options = computed(() => {
    return dictStore.getDictArray(toValue(dictType));
  });

  /** 加载字典数据 */
  async function load(): Promise<void> {
    const type = toValue(dictType);
    if (!type) return;
    loading.value = true;
    try {
      await dictStore.getDict([type]);
      loaded.value = true;
    } finally {
      loading.value = false;
    }
  }

  /** 确保字典已加载（已加载则跳过） */
  async function ensureLoaded(): Promise<void> {
    if (loaded.value) return;
    await load();
  }

  /**
   * 根据字典 value 获取 label 中文名
   * @param value - 字典值
   * @returns 字典标签，未找到时返回原值
   */
  function getLabel(value: string | number | undefined | null): string {
    if (value == null || value === "") return "";
    const type = toValue(dictType);
    const item = dictStore.getDictArray(type).find((d) => d.dict_value === String(value));
    return item ? item.dict_label : String(value);
  }

  return {
    /** 响应式选项列表 */
    options,
    /** 是否已加载 */
    loaded,
    /** 是否加载中 */
    loading,
    /** 手动加载字典（强制重新请求） */
    load,
    /** 确保字典已加载（推荐使用） */
    ensureLoaded,
    /** 根据 value 获取 label */
    getLabel,
  };
}
