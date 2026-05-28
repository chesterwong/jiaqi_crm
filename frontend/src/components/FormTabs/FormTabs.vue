<template>
  <div class="form-tabs-container">
    <!-- 步骤条 -->
    <el-steps
      v-if="showStepper && mode !== 'view'"
      :active="currentStep"
      :align-center="tabs.length > 4"
      simple
      class="form-tabs-stepper"
    >
      <el-step
        v-for="(tab, index) in tabs"
        :key="tab.name"
        :title="tab.stepTitle || tab.label"
        :status="stepStatus(index)"
        @click="handleStepClick(index)"
      />
    </el-steps>

    <!-- 页签切换 -->
    <el-tabs v-model="activeKey" :tab-position="tabPosition" @tab-click="handleTabClick">
      <el-tab-pane v-for="tab in tabs" :key="tab.name" :name="tab.name" :lazy="lazy">
        <template #label>
          <span
            :class="[
              'form-tabs-label',
              tabStatuses[tab.name] === 'error' ? 'tab-label-error' : '',
              tabStatuses[tab.name] === 'success' ? 'tab-label-success' : '',
            ]"
          >
            {{ tab.label }}
            <el-icon
              v-if="tabStatuses[tab.name] === 'success'"
              class="tab-status-icon tab-status-success"
            >
              <Check />
            </el-icon>
            <el-icon
              v-if="tabStatuses[tab.name] === 'error'"
              class="tab-status-icon tab-status-error"
            >
              <WarningFilled />
            </el-icon>
          </span>
        </template>

        <div class="form-tabs-content">
          <Transition :name="transitionName" mode="out-in">
            <slot :key="tab.name" :name="`tab-${tab.name}`" />
          </Transition>
        </div>
      </el-tab-pane>
    </el-tabs>

    <!-- 底部操作栏 -->
    <div class="form-tabs-footer">
      <div class="form-tabs-footer__left">
        <slot name="footer-left" />
      </div>
      <div class="form-tabs-footer__right">
        <slot name="footer-extra" />

        <el-button v-if="showStepper && mode !== 'view' && currentStep > 0" @click="handlePrevious">
          上一步
        </el-button>

        <el-button
          v-if="showStepper && mode !== 'view' && currentStep < tabs.length - 1"
          type="primary"
          @click="handleNext"
        >
          下一步
        </el-button>

        <slot name="footer-submit">
          <el-button
            v-if="!showStepper || currentStep === tabs.length - 1"
            v-show="mode !== 'view'"
            type="primary"
            @click="emit('submit')"
          >
            {{ mode === "create" ? "提交" : "保存" }}
          </el-button>
        </slot>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, ref, watch, nextTick } from "vue";
import { Check, WarningFilled } from "@element-plus/icons-vue";
import type { TabPaneName } from "element-plus";

// ── 类型定义 ──

export interface TabConfig {
  /** Tab 唯一标识（用于 slot 名称匹配） */
  name: string;
  /** 展示文本 */
  label: string;
  /** 步骤条标题（不传则只显示 Tab，无步骤提示） */
  stepTitle?: string;
}

export interface TabStatuses {
  [tabName: string]: "normal" | "error" | "success";
}

export interface FormTabsProps {
  /** 当前激活的 Tab（v-model） */
  activeTab: string;
  /** Tab 配置列表 */
  tabs: TabConfig[];
  /** 每个 Tab 的校验状态 */
  tabStatuses: TabStatuses;
  /** 表单模式 */
  mode?: "create" | "edit" | "view";
  /** 是否显示步骤条 */
  showStepper?: boolean;
  /** 切换动画名称（默认无动画） */
  transitionName?: string;
  /** 页签位置 */
  tabPosition?: "top" | "left" | "right" | "bottom";
  /** 是否懒加载页签内容 */
  lazy?: boolean;
}

// ── Props & Emits ──

const props = withDefaults(defineProps<FormTabsProps>(), {
  mode: "create",
  showStepper: false,
  transitionName: "",
  tabPosition: "top",
  lazy: true,
});

const emit = defineEmits<{
  "update:activeTab": [tabName: string];
  /** Tab 切换前守卫，返回 false 阻止切换 */
  "before-tab-change": [targetTabName: string, currentTabName: string];
  previous: [];
  next: [];
  submit: [];
}>();

// ── 内部状态 ──

const activeKey = computed({
  get: () => props.activeTab,
  set: (name: string) => emit("update:activeTab", name),
});

/** 当前步骤索引 */
const currentStep = computed(() => {
  const idx = props.tabs.findIndex((t) => t.name === props.activeTab);
  return idx >= 0 ? idx : 0;
});

// ── Tab 切换守卫 ──

async function handleTabClick(pane: { props: { name?: string | number } }) {
  const targetName = String(pane.props.name ?? "");
  if (!targetName || targetName === props.activeTab) return;

  // 仅在 create/edit 模式拦截
  if (props.mode === "view") {
    activeKey.value = targetName;
    return;
  }

  // 通过 emit 让父组件决定是否允许切换
  let allowSwitch = true;
  // 使用 nextTick 确保 emit 已处理
  emit("before-tab-change", targetName, props.activeTab);
  // 父组件可以在 before-tab-change 中修改 tabStatuses，
  // 如果 targetName 的 status 被设为 "error"，则阻止切换
  await nextTick();
  if (props.tabStatuses[targetName] === "error") {
    allowSwitch = false;
  }

  if (allowSwitch) {
    activeKey.value = targetName;
  }
}

// ── 步骤条联动 ──

function handleStepClick(index: number) {
  const tabName = props.tabs[index]?.name;
  if (tabName) {
    activeKey.value = tabName;
  }
}

/** 获取步骤状态 */
function stepStatus(index: number): "" | "wait" | "process" | "finish" | "error" | "success" {
  const tab = props.tabs[index];
  if (!tab) return "wait";

  const status = props.tabStatuses[tab.name];
  if (status === "error") return "error";
  if (index < currentStep.value) return "success";
  if (index === currentStep.value) return "process";
  return "wait";
}

// ── 上一步 / 下一步 ──

function handlePrevious() {
  if (currentStep.value > 0) {
    activeKey.value = props.tabs[currentStep.value - 1].name;
    emit("previous");
  }
}

async function handleNext() {
  emit("before-tab-change", props.activeTab, props.activeTab);
  await nextTick();

  if (props.tabStatuses[props.activeTab] !== "error") {
    if (currentStep.value < props.tabs.length - 1) {
      activeKey.value = props.tabs[currentStep.value + 1].name;
      emit("next");
    }
  }
}

// ── Expose ──

/** 滚动到第一个错误 Tab */
function scrollToError() {
  const errorTab = props.tabs.find((t) => props.tabStatuses[t.name] === "error");
  if (errorTab) {
    activeKey.value = errorTab.name;
  }
}

defineExpose({
  scrollToError,
  currentStep,
});
</script>

<style scoped lang="scss">
.form-tabs-container {
  display: flex;
  flex-direction: column;
  gap: 0;
}

.form-tabs-stepper {
  margin-bottom: 20px;
  cursor: pointer;
}

.form-tabs-content {
  min-height: 200px;
  padding: 4px 0;
}

.form-tabs-label {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  font-size: 14px;
}

.tab-label-error {
  color: var(--el-color-danger);
  animation: tab-flash-error 0.6s ease-in-out 2;
}

.tab-label-success {
  color: var(--el-color-success);
}

.tab-status-icon {
  font-size: 14px;
}

.tab-status-success {
  color: var(--el-color-success);
}

.tab-status-error {
  color: var(--el-color-danger);
}

.form-tabs-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: 16px;
  margin-top: 16px;
  border-top: 1px solid var(--el-border-color-light);

  &__left,
  &__right {
    display: flex;
    align-items: center;
    gap: 8px;
  }
}

// 动画
.slide-fade-enter-active {
  transition: all 0.3s ease-out;
}

.slide-fade-leave-active {
  transition: all 0.2s ease-in;
}

.slide-fade-enter-from {
  transform: translateX(20px);
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateX(-20px);
  opacity: 0;
}

@keyframes tab-flash-error {
  0%,
  100% {
    color: var(--el-color-danger);
  }
  50% {
    color: inherit;
  }
}
</style>
