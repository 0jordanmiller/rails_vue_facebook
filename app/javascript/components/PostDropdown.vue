<template>
  <div @click="test">
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
      console.log(this.id);
      axios.delete(`/${postOrComment}/` + this.id).then((res) => {
        console.log(res);
      });
    },
    test() {
      console.log(this.postOrComment);
    },
  },
};
</script>
<style >
.options:hover {
  cursor: pointer;
}
</style>

