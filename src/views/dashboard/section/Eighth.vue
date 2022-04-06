<template>
  <div class="DashboardEighthSection">
    <v-container
      id="DashboardEighthSection"
      tag="section"
      style="padding: 0 15px;height:60vh;"
    >
      <v-row
        align="center"
        no-gutters
        style="font-size:21px;padding:0;margin:0; height:100%;"
      >
        <v-col
          cols="12"
          class="d-flex justify-center align-center"
          style="padding:0 20px;height:100%;"
        >
          <div class="d-flex justify-center align-center eDiv">
            <v-row align="center" no-gutters>
              <v-col
                cols="12"
                md="8"
                class="d-flex justify-center align-center"
                style="padding:0 0 0 40px;height:100%;"
              >
                <h3 class="eTextH3">
                  Untuk memperoleh informasi lebih lanjut dan mengetahui
                  program-program kami lainnya.
                </h3>
              </v-col>
              <v-col
                cols="12"
                md="4"
                class="d-flex justify-center align-center"
                style="padding:0 20px;height:100%;"
              >
                <router-link to="/pages/kontak">
                  <v-btn
                    elevation="4"
                    class="cButton"
                    style="color:hsl(140, 100%,85%);border:2px solid hsl(150, 100%, 55%);  background:rgba(255,255,255, 0.5); font-weight:bold;"
                  >
                    Hubungi Kami
                  </v-btn>
                </router-link>
              </v-col>
            </v-row>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardEighthSection',

  data() {
    return {}
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.DashboardEighthSection {
  background-image: -webkit-linear-gradient(bottom, #ffeb3b, transparent);
  background-image: linear-gradient(to top, #ffeb3b, transparent);

  .eDiv {
    border: 1.5px solid hsl(150, 100%, 55%);
    width: 90%;
    height: 50%;
    border-radius: 40px 10px 40px 10px;
    padding: 15px;
    background: #06115c9c;

    .eTextH3 {
      color: white;
    }
    .cButton {
      font-size: 14px;
      width: 150px;
      height: 50px;
    }
  }

  @media (max-width: 960px) {
    .eDiv {
      .eTextH3 {
        margin-bottom: 30px;
      }
    }
  }
  @media (max-width: 750px) {
    .eDiv {
      .eTextH3 {
        font-size: 4vw;
      }
      .cButton {
        font-size: 12px;
        width: 130px;
        height: 30px;
      }
    }
  }
}
</style>
