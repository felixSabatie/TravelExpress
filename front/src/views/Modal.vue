<template>
  <transition name="modal" >
    <div class="modal-mask" @keydown.esc="close" @click="close">
      <div class="modal-wrapper">
        <div class="modal-container" @click.stop="">

          <div class="modal-header">
            <slot name="header">
            </slot>
          </div>

          <div class="modal-body">
            <slot name="body">
            </slot>
          </div>

          <div class="modal-footer">
            <slot name="footer">
              <button class="btn" @click.stop="close">OK</button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: "Modal",
  methods: {
    close() {
      this.$emit('close');
    }
  }
};
</script>

<style lang='scss'>

.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100vw;
  min-height: 100vh;
  max-height: 100vh;
  margin: 0;
  overflow: hidden;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: opacity 0.3s ease;

  .modal-wrapper {

    .modal-container {
      min-width: 300px;
      max-width: 90%;
      max-height: 90%;
      overflow-y: auto;
      overflow-x: hidden;
      margin: 0 auto;
      padding: 20px 30px;
      background-color: #fff;
      border-radius: 2px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
      transition: all 0.3s ease;
      font-family: Helvetica, Arial, sans-serif;

      .modal-footer {
        padding-top: 10px;
        background-color: #fff;
      }
    }
  }
}

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
