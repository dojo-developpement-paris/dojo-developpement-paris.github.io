<script setup lang="ts">
import ForestComponent from "@/forest-component.vue";
import type { CellState } from "@/__tests__/CellComponent.vue";
import { reactive } from "vue";

const forest: CellState[][] = reactive([
  ["burning", "tree", "empty"],
  ["tree", "tree", "empty", "tree"],
  ["empty", "burning", "tree"],
]);

const nextState = () => {
  forest[0]![0] = forest[0]![0] === "empty" ? "burning" : "empty";
};

setInterval(nextState, 1000);
</script>

<template>
  <ForestComponent :forest="forest" />
</template>

<style scoped></style>
