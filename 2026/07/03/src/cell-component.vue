<template>
  <div :class="has" />
</template>

<script lang="ts" setup>
export type CellState = "tree" | "empty" | "burning";
defineProps<{
  has: CellState;
}>();
</script>

<style lang="css" scoped>
div {
  height: 100px;
  width: 100px;
  border: solid 1px;
}

.tree {
  background-color: green;
}
.empty {
  background-color: #411800;
}
.burning {
  background-color: red;
}
</style>
