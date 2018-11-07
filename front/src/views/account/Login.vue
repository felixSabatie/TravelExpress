<template>
  <div class="login container">
    <h2>Se connecter</h2>
    <ListLifts></ListLifts>
    <!--<Authentification-form :isAlreadyRegistered="true" ></Authentification-form>-->
  </div>
</template>

<script>
  import AuthentificationForm from "./AuthentificationForm";
  import ListLifts from "../lift/ListLifts";
  export default {
    name: "Login",
    components: {ListLifts, AuthentificationForm}
  }
</script>

<style scoped>

</style>