<template>
  <div class="modal-card" style="width: auto">
    <header class="modal-card-head">
      <p class="modal-card-title">{{ title }}</p>
      <button type="button" class="delete" @click="$emit('close-modal')" />
    </header>

    <section class="modal-card-body">
      <form enctype="multipart/form-data">
        <input type="file" ref="inputFile" @change="uploadFile()" />

        <button class="button is-primary is-small" @click="createItem">
          Update
        </button>
      </form>
    </section>
  </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators";

import axios from "../backend";
export default {
  name: "update-picture",
  props: ["title", "pictureType"],
  methods: {
    // Saving the file in our data to send it !
    uploadFile() {
      this.inputPicture = this.$refs.inputFile.files[0];
    },

    // Collecting everything inside our FormData object
    createItem() {
      const params = {
        picture: this.inputPicture,
        user_id: this.$store.state.user.id,
        type: this.pictureType,
      };

      let formData = new FormData();

      Object.entries(params).forEach(([key, value]) =>
        formData.append(key, value)
      );

      // Finally, sending the POST request with our beloved Axios
      axios.post("/upload", formData).then((response) => {});
    },
  },
  data: function () {
    return {
      inputPicture: null,
    };
  },
};
</script>
