<template>
  <div id="app">
    <sui-button color="red" inverted>Red</sui-button>
    <p>{{ message }}</p>
    <sample></sample>
  </div>
</template>

<script>
import "semantic-ui-css/semantic.min.css";

import Vue from "vue";
import SuiVue from "semantic-ui-vue";
Vue.use(SuiVue);
console.log(SuiVue);

import Sample from "./sample.vue";
export default {
  data: function () {
    return {
      message: "Welcome to Cinematronix!",
    };
  },
  components: {
    Sample,
  },
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
