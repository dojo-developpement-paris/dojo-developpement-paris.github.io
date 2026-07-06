import { describe, expect, it } from "vitest";
import { shallowMount } from "@vue/test-utils";
import CellComponent from "@/cell-component.vue";

describe("Cell component", () => {
  it("should display a cell", async () => {
    const wrapper = shallowMount(CellComponent, {
      props: {
        has: "tree",
      },
    });

    expect(wrapper.find("div").classes()).toEqual(["tree"]);
  });

  it("should display a empty cell", async () => {
    const wrapper = shallowMount(CellComponent, {
      props: {
        has: "empty",
      },
    });

    expect(wrapper.find("div").classes()).toEqual(["empty"]);
  });

  it("should display a burning tree", async () => {
    const wrapper = shallowMount(CellComponent, {
      props: {
        has: "burning",
      },
    });

    expect(wrapper.find("div").classes()).toEqual(["burning"]);
  });
});
