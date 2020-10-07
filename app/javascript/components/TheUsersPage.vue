<template>
  <div>
    <f-users :data="users" :addFriend="true" />
  </div>
</template>

<script>
import BaseBox from "./BaseBox";
import axios from "../backend";
export default {
  name: "users",
  data() {
    return {
      users: [],
      friendRequestSent: [],
      friendships: [],
    };
  },
  created() {
    this.showUsers();
    this.showFriendRequestSent();
  },
  methods: {
    showUsers: function () {
      axios
        .get("/users", {
          params: {
            user_id: this.$store.state.user.id,
          },
        })
        .then((response) => {
          this.users = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    showFriendRequestSent() {
      axios
        .get("/friend_requests/sent_to", {
          params: { user_id: this.$store.state.user.id },
        })
        .then((response) => {
          console.log(response);
          this.friendRequestSent = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  components: {
    "f-users": BaseBox,
  },
};
</script>