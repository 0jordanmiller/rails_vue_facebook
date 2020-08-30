<template>
  <div id="app">
    <p>Facebook</p>
    <router-link to="/foo">Go to Foo</router-link>
    <br />
    <router-view></router-view>
  </div>
</template>

<script>
import VueRouter from "vue-router";
import "semantic-ui-css/semantic.min.css";
import Vue from "vue";
import SuiVue from "semantic-ui-vue";
import Sample from "./sample.vue";
Vue.use(VueRouter);
Vue.use(SuiVue);

const routes = [{ path: "/foo", component: Sample }];
const router = new VueRouter({
  routes: routes,
});

export default {
  data: function () {
    return {
      message: "Facebook",
    };
  },
  components: {
    Sample,
  },
  router,
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
