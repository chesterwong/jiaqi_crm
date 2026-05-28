<template>
  <div class="health-score-card">
    <div class="health-score-card__gauge">
      <el-progress
        type="dashboard"
        :percentage="percentage"
        :color="scoreColor"
        :stroke-width="10"
        :width="80"
      >
        <template #default="{ percentage: pct }">
          <span class="health-score-value">{{ Math.round(pct) }}</span>
        </template>
      </el-progress>
    </div>
    <div class="health-score-card__info">
      <el-tag :type="levelTagType" size="small" effect="dark">
        {{ levelLabel }}
      </el-tag>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from "vue";

const props = defineProps<{
  /** 综合评分 0-100 */
  score?: number | null;
  /** 健康等级 (如: healthy, warning, critical) */
  level?: string | null;
}>();

const percentage = computed(() => {
  if (props.score == null) return 0;
  return Math.min(100, Math.max(0, Number(props.score)));
});

const scoreColor = computed(() => {
  const s = percentage.value;
  if (s >= 80) return "#67C23A";
  if (s >= 60) return "#409EFF";
  if (s >= 40) return "#E6A23C";
  return "#F56C6C";
});

const levelLabel = computed(() => {
  if (!props.level) return "-";
  const map: Record<string, string> = {
    healthy: "健康",
    warning: "预警",
    critical: "危险",
    excellent: "优秀",
    good: "良好",
    fair: "一般",
    poor: "较差",
  };
  return map[props.level] || props.level;
});

const levelTagType = computed<"success" | "warning" | "danger" | "info" | "primary">(() => {
  if (!props.level) return "info";
  const map: Record<string, "success" | "warning" | "danger" | "info" | "primary"> = {
    healthy: "success",
    excellent: "success",
    warning: "warning",
    fair: "warning",
    critical: "danger",
    poor: "danger",
    good: "primary",
  };
  return map[props.level] || "info";
});
</script>

<style scoped lang="scss">
.health-score-card {
  display: flex;
  align-items: center;
  gap: 8px;

  &__gauge {
    flex-shrink: 0;
  }

  &__info {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }
}

.health-score-value {
  font-size: 18px;
  font-weight: 700;
}
</style>
