import { describe, expect, it } from "vitest";
import { shallowMount } from "@vue/test-utils";
import ForestComponent from "@/forest-component.vue";
import CellComponent from "@/cell-component.vue";

describe("Forest component", () => {
  it("should display a simple forest", async () => {
    const wrapper = shallowMount(ForestComponent, {
      props: { forest: [["empty", "tree", "empty"]] },
    });

    const [cell1, cell2, cell3] = wrapper.findAllComponents(CellComponent);
    expect(cell1?.props()).toEqual({ has: "empty" });
    expect(cell2?.props()).toEqual({ has: "tree" });
    expect(cell3?.props()).toEqual({ has: "empty" });
  });

  it("should display burning forest", async () => {
    const wrapper = shallowMount(ForestComponent, {
      props: { forest: [["burning", "burning", "empty"]] },
    });

    const [cell1, cell2, cell3] = wrapper.findAllComponents(CellComponent);
    expect(cell1?.props()).toEqual({ has: "burning" });
    expect(cell2?.props()).toEqual({ has: "burning" });
    expect(cell3?.props()).toEqual({ has: "empty" });
  });

  it("should display column forest", async () => {
    const wrapper = shallowMount(ForestComponent, {
      props: { forest: [["burning"], ["tree"], ["empty"]] },
    });

    const [cell1, cell2, cell3] = wrapper.findAllComponents(CellComponent);
    expect(cell1?.props()).toEqual({ has: "burning" });
    expect(cell2?.props()).toEqual({ has: "tree" });
    expect(cell3?.props()).toEqual({ has: "empty" });
  });
});
