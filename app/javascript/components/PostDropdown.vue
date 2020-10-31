<template>
  <div>
    <b-dropdown aria-role="list">
      <font-awesome-icon
        class="options"
        slot="trigger"
        :icon="['fas', 'ellipsis-v']"
      />
      <b-dropdown-item aria-role="listitem">Edit</b-dropdown-item>
      <b-dropdown-item @click="deletePost(postOrComment)" aria-role="listitem"
        >Delete</b-dropdown-item
      >
    </b-dropdown>
  </div>
</template>

<script>
import axios from "../backend";
export default {
  name: "Dropdown",
  props: ["id", "postOrComment"],
  methods: {
    deletePost(postOrComment) {
      axios.delete(`/${postOrComment}/` + this.id).then((res) => {
        console.log(res);
        this.$emit("update-page");
      });
    },
  },
};
</script>
<style >
.options:hover {
  cursor: pointer;
}
</style>

