<template>
  <div id="app">
    <navbar />
    <router-link to="/foo">Go to Foo</router-link>
    <router-view></router-view>
  </div>
</template>

<script>
import VueRouter from "vue-router";
import Vue from "vue";
import Routes from "../routes/index";
import Buefy from "buefy";
import "buefy/dist/buefy.css";
import Navbar from "./navbar";

Vue.use(Buefy);
Vue.use(VueRouter);
const router = new VueRouter({
  routes: Routes,
});

export default {
  data: function () {
    return {
      message: "Facebook",
    };
  },
  components: { Navbar },
  router,
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
