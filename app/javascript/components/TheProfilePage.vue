<template lang="">
    <div>
      <div>
        <div class="cover-wrap">
          <img id="cover-picture" src="" alt="">
          <div v-if="userProfile" >
            <update-picture buttonText="Update Profile Picture">
            <div slot='content'>
              <update-picture-content pictureType="profile" title="Update Profile Picture"/>
            </div>
          </update-picture>
          <update-picture buttonText="Update Cover Picture">
            <div slot='content'>
              <update-picture-content pictureType="cover" title="Update Cover Picture" />
            </div>            
          </update-picture>
          </div>
        </div>
        <h1> {{ name }} </h1>
      </div>
        <b-button v-if="!userProfile" @click="" type="is-info">Add Friend</b-button>
        <show-posts pageType="profile" />
    </div>
</template>

<script>
import posts from "./AppPosts";
import StatusWriteBox from "./StatusWriteBox";
import modal from "./modal";
import updatePictureContent from "./UpdatePictureContent";
import axios from "../backend";

export default {
  name: "Profile",

  components: {
    "write-status": StatusWriteBox,
    "show-posts": posts,
    "update-picture": modal,
    "update-picture-content": updatePictureContent,
  },
  methods: {
    fetchUserData() {
      axios
        .get("/users/", {
          params: {
            id: this.$route.params.id,
          },
        })
        .then((resp) => {
          console.log(resp);
        });
    },
  },
  computed: {
    userProfile() {
      return this.$store.state.user.id === parseInt(this.$route.params.id);
    },
    signedIn() {
      return this.$store.state.user;
    },
    userId() {
      return this.$store.state.user.id;
    },
  },
  data() {
    return {
      name: this.$store.state.user.name,
    };
  },
  created() {
    this.fetchUserData();
  },
};
</script>


<style>
.cover-wrapper #cover-picture {
  width: 100%;
  height: auto;
}

.cover-wrapper {
  position: relative;
  width: 50%;
}

#cover-picture {
  max-height: 400px;
  margin: auto;
  display: block;
  width: 600px;
}
</style>