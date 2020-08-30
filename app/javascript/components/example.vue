<template>
  <div id="a">
    <p>{{ msg }}</p>
  </div>
</template>

<script>
import Sample from "./sample.vue";
export default {
  data: function () {
    return {
      msg: "Example",
    };
  },
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
