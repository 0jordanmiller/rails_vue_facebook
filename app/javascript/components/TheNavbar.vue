<template>
  <b-navbar :mobile-burger="true" :fixed-top="true" v-if="signedIn">
    <template slot="start">
      <b-navbar-item>
        <router-link to="/">Facebook</router-link>
      </b-navbar-item>
      <b-navbar-item>
        <router-link :to="userProfile">Profile</router-link>
      </b-navbar-item>
      <b-navbar-item>
        <router-link to="/friend_requests">Friend Requests</router-link>
      </b-navbar-item>
      <b-navbar-item>
        <router-link to="/users">Users</router-link>
      </b-navbar-item>
      <b-navbar-item>
        <router-link to="/friends">Friends</router-link>
      </b-navbar-item>
    </template>

    <template slot="end">
      <b-navbar-item tag="div">
        <div class="buttons">
          <section id="notification">
            <b-collapse :open="false" aria-id="contentIdForA11y1">
              <button
                class="button"
                slot="trigger"
                aria-controls="contentIdForA11y1"
              >
                <font-awesome-icon :icon="['fas', 'bell']" />
              </button>
              <div class="notification">
                <div
                  class="content"
                  v-for="data in notifications"
                  :key="data.id"
                >
                  <p class="notification-text">
                    <span class="user-name">{{ data.sender }}</span>
                    <span v-if="data.action === 'like'"> liked your post </span>
                    <span v-else-if="data.action === 'friend'"
                      >friended you</span
                    >
                    <span v-else-if="data.action === 'comment'"
                      >commented on your post</span
                    >
                  </p>
                </div>
              </div>
            </b-collapse>
          </section>

          <button to="/" class="button is-danger" @click="signOut">
            Sign out
          </button>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
import Vue from "vue";
import VueRouter from "vue-router";
import axios from "../backend";

Vue.use(VueRouter);

export default {
  name: "nav-bar",
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
    userProfile() {
      return "/user/" + this.$store.state.user.id;
    },
  },
  methods: {
    getNotifications() {
      axios
        .get("/notifications", {
          params: {
            id: this.$store.state.user.id,
          },
        })
        .then((response) => {
          this.notifications = response.data;
          console.log(this.notifications);
        });
    },
    signOut() {
      console.log("aaa");
      axios
        .delete("/users/sign_out")
        .then((response) => {
          this.$cookie.delete("session");
        })
        .catch((error) => {
          console.log(error);
        });
      this.$store.commit("signOut");
    },
  },
  data() {
    return {
      notifications: [],
    };
  },
  created() {
    this.getNotifications();
    console.log(this.notifications);
  },
};
</script>

<style scoped>
.content {
  padding: 1rem 1.5rem 1rem 1.5rem;
}

.notification {
  padding: 0px;
}

.notification {
  border-radius: 12px;
}

.content {
  margin-bottom: unset !important;
}

.notification .user-name {
  font-weight: 700;
}

.notification p {
  font-size: 14px;
  font-weight: 400;
}
button.button {
  border-radius: 50px;
}
#notification {
  margin-right: 10px;
}
.notification-pic {
  padding-right: 5px;
  float: left;
}

p.notification-text {
  text-align: left;
}

.notification {
  position: absolute;
  right: 1%;
  width: 300px;
}

p {
  font-size: 2em;
  text-align: center;
}
</style>
