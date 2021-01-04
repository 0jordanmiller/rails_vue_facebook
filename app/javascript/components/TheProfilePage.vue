<template lang="">
    <div>
      <div>
        <div class="cover-wrap">
          <div class="pictures">
            <img id="cover-picture" :src="this.cover_picture" alt="cover">
            <img id="profile-picture" :src="this.profile_picture" alt="profile">
            <div v-if="userProfile" >
              <update-picture id="edit-profile" buttonText="Edit Profile Picture">
                <div slot='content'>
                  <update-picture-content pictureType="profile" title="Edit Profile Picture"/>
                </div>
            </update-picture>
            <update-picture id="edit-cover" buttonText="Edit Cover Picture">
              <div slot='content'>
                <update-picture-content pictureType="cover" title="Edit Cover Picture" />
              </div>            
            </update-picture>
          </div>
          </div>
          {{this.$store.state.count}}
          <button @click="increment">test</button>
        </div>
        
        <h1 id="name"> {{ name }} </h1>
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
  data() {
    return {
      name: "",
      profile_picture: "",
      cover_picture: "",
    };
  },
  methods: {
    increment() {
      this.$store.commit("increment");
    },
    fetchUserData() {
      axios.get(`/users/${this.$route.params.id}`).then((res) => {
        console.log(res);
        this.name = res.data.user.name;
        this.profile_picture = res.data.profile_picture;
        this.cover_picture = res.data.cover_picture;
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

.cover-wrap {
  min-height: 390px;
}

#profile-picture {
  position: relative;
  left: 50%;
  max-width: 130px;
  transform: translate(-50%, 200%);
  border-radius: 200px;
}

#cover-picture {
  max-width: 1000px;
  max-height: 420px;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -10%);
}
#name {
  text-align: center;
}

/* section#edit-cover {
  position: relative;
  transform: translate(62%, 480%);
  right: 20%;
} */
</style>