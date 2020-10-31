<template>
  <div>
    <f-request @notify="success" v-bind:requests="friend_requests" />

    <h1 v-if="friend_requests.length === 0">No friend requests :(</h1>
  </div>
</template>

<script>
import axios from "../backend";
import request from "./RequestBox";

export default {
  name: "friend-requests",
  components: {
    "f-request": request,
  },
  data: function () {
    return {
      friend_requests: [],
    };
  },
  created() {
    this.showFriendRequests();
  },
  methods: {
    success() {
      this.$buefy.notification.open({
        message: "Request Accepted",
        type: "is-success",
      });
      this.showFriendRequests();
    },
    showFriendRequests() {
      axios
        .get("/friend_requests", {
          params: { user_id: this.$store.state.user.id },
        })
        .then((response) => {
          console.log(response.data);
          this.friend_requests = response.data;
        });
    },
  },
};
</script>