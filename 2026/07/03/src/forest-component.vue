<script setup lang="ts">
import CellComponent, { type CellState } from "@/cell-component.vue";

defineProps<{
  forest: CellState[][];
}>();
</script>

<template>
  <div v-for="(line, index) in forest" :key="index" class="line">
    <CellComponent v-for="cell in line" :key="cell" :has="cell" />
  </div>
</template>

<style lang="css" scoped>
.line {
  display: flex;
}
</style>
