<template>
  <div class="file-upload">
    <el-upload
      v-model:file-list="uploadFiles"
      class="file-upload__control"
      drag
      :accept="accept"
      :limit="props.limit"
      :before-upload="handleBeforeUpload"
      :http-request="handleUpload"
      :on-success="handleSuccess"
      :on-error="handleError"
      :on-remove="handleRemove"
      :disabled="props.disabled"
    >
      <el-icon class="el-icon--upload">
        <UploadFilled />
      </el-icon>
      <div class="el-upload__text">
        拖拽文件到此处或
        <em>点击上传</em>
      </div>
      <template #tip>
        <div class="el-upload__tip">
          {{ props.tipText || `支持 ${accept} 格式，单文件最大 ${props.maxFileSize}MB` }}
        </div>
      </template>
    </el-upload>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import {
  ElMessage,
  type UploadRawFile,
  type UploadRequestOptions,
  type UploadUserFile,
} from "element-plus";
import { UploadFilled } from "@element-plus/icons-vue";
import ParamsAPI from "@/api/module_system/params";

interface UploadFileInfo {
  file_name: string;
  file_path: string;
  file_url: string;
  file_type?: string;
  mime_type?: string;
  file_size?: number;
}

const props = defineProps<{
  /** 已存在的文件数据（编辑时） */
  modelValue?: UploadFileInfo | null;
  /** 允许的文件类型 */
  accept?: string;
  /** 最大文件大小(MB) */
  maxFileSize?: number;
  /** 上传限制数量 */
  limit?: number;
  /** 是否禁用 */
  disabled?: boolean;
  /** 提示文本 */
  tipText?: string;
}>();

const emit = defineEmits<{
  (e: "update:modelValue", val: UploadFileInfo | null): void;
  (e: "success", val: UploadFileInfo): void;
  (e: "error", err: Error): void;
}>();

const uploadFiles = ref<UploadUserFile[]>([]);

// 初始化已有文件
if (props.modelValue?.file_name) {
  uploadFiles.value = [
    {
      name: props.modelValue.file_name,
      url: props.modelValue.file_url || props.modelValue.file_path,
    } as UploadUserFile,
  ];
}

function handleBeforeUpload(file: UploadRawFile): boolean {
  const maxSize = (props.maxFileSize || 50) * 1024 * 1024;
  if (file.size > maxSize) {
    ElMessage.warning(`文件大小不能超过 ${props.maxFileSize || 50}MB`);
    return false;
  }
  return true;
}

async function handleUpload(options: UploadRequestOptions) {
  const file = options.file;
  const formData = new FormData();
  formData.append("file", file);

  const response = await ParamsAPI.uploadFile(formData);
  if (response.data.code === 0) {
    return response.data.data as UploadFileInfo;
  } else {
    throw new Error(response.data.msg || "上传失败");
  }
}

function handleSuccess(response: UploadFileInfo) {
  const fileInfo: UploadFileInfo = {
    file_name: response.file_name,
    file_path: response.file_path || response.file_url,
    file_url: response.file_url || response.file_path,
    file_type: response.file_type || getFileExt(response.file_name),
    mime_type: response.mime_type || "",
    file_size: response.file_size || 0,
  };
  emit("update:modelValue", fileInfo);
  emit("success", fileInfo);
  ElMessage.success("文件上传成功");
}

function handleError(error: Error) {
  ElMessage.error(error.message || "文件上传失败");
  emit("error", error);
}

function handleRemove() {
  emit("update:modelValue", null);
}

function getFileExt(fileName: string): string {
  return fileName.split(".").pop() || "";
}
</script>

<style scoped lang="scss">
.file-upload {
  width: 100%;

  &__control {
    width: 100%;
  }
}
</style>
