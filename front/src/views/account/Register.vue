<template>
  <div class="register">
    <h2>S'inscrire</h2>
    <Authentification-form :isAlreadyRegistered="false" ></Authentification-form>
  </div>
</template>

<script>
  import AuthentificationForm from "./AuthentificationForm";
  export default {
    name: "Register",
    components: {AuthentificationForm}
  }
</script>

<style scoped>

</style>