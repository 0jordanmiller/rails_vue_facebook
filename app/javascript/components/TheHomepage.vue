<template lang="">
<div>
    <div class="columns default" v-if="!signedIn">
      <div class="column is-6">
        <h1>facebook</h1>
      </div>
      <div class="column is-6 login-pane">
        <sign-in />
        <hr style="background: #d7d7d7; height: 1px;"/>
        <signup-modal style="border-radius:15px;" class="create-account" buttonText="Create New Account" >
          <div slot='content'>
            <signup-content v-on:close="closeModal"/>
          </div>
        </signup-modal>
      </div>
    </div>

    <div v-else>
        <show-posts pageType='home' />
    </div>
</div>

</template>

<script>
import signin from "./signin";
import posts from "./AppPosts";
import modal from "./modal";
import signup from "./signup";

export default {
  name: "home",
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
  },
  components: {
    "sign-in": signin,
    "signup-modal": modal,
    "show-posts": posts,
    "signup-content": signup,
  },
  methods: {
    closeModal() {
      console.log("abc");
      this.isComponentModalActive = false;
    },
  },
};
</script>

<style>
.login-pane {
  background: #e8e8e8;
  padding: 40px;
}
.default {
  padding-top: 15%;
}
h1 {
  font-size: 40px;
}

.create-account {
  margin-top: 35px;
  text-align: center;
}
.create-account button {
  width: 100%;
  font-size: 30px;
}
</style>