<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="KontakKami"
      tag="section"
      style="padding: 0 15px;min-height:75vh; position:relative; top:-30px;background:rgba(255,255,255,0.7);"
    >
      <v-row
        align="center"
        no-gutters
        style="font-size:18px;padding:0;margin:0;"
      >
        <v-col
          cols="12"
          class="d-flex"
          style="position:relative; top:-37px;padding:0 20px;"
        >
          <h2 class="hTitle">Kontak Kami</h2>
        </v-col>
        <v-col
          cols="12"
          style="width:90%; height:45vh; padding:0 20px; display:flex; flex-direction:column; justify-content:center; align-items:center;"
        >
          <iframe
            width="100%"
            height="100%"
            frameborder="0"
            style="border:4px solid hsla(230, 100%, 30%, 0.8); box-shadow: 1px 1px 5px red;"
            :src="
              `https://www.google.com/maps/embed/v1/place
  ?key=AIzaSyATI-pRchP7-f0ty8rsP6_Km-3cLvLf6OE
  &q=${coordinates.lat},${coordinates.lng}&zoom=18`
            "
            allowfullscreen
          >
          </iframe>
        </v-col>
        <v-col cols="12" style="padding:20px 20px 50px;">
          <v-row style="padding:15px;" no-gutters>
            <!-- <v-col cols="6"> -->
            <!-- <div style="text-align:center;">
                <v-img
                  alt="lsp-pmi"
                  contain
                  aspect-ratio="3.5"
                  src="../../../public/LSPPMI_Logo.jpeg"
                  transition="scale-transition"
                />
                <div class="logoTitleMax">
                  <p style="margin:0;font-weight:900; ">LSP PROMIGAS</p>
                  <p style="margin:0;font-weight:900; ">INDONESIA</p>
                </div>
              </div> -->
            <!-- </v-col> -->
            <v-col cols="12" md="6" style="text-align:left;">
              <div class="d-flex justify-start align-center">
                <p
                  style="margin:0;font-weight:500;border-bottom:1px solid black;"
                >
                  Detail Kontak
                </p>
              </div>
              <div
                class="d-flex justify-start align-start"
                style="padding-top:20px;"
              >
                <div class="d-flex" style="padding-top:3px;">
                  <v-icon small style=" text-shadow: -3px 3px 10px black;">
                    mdi-home-city
                  </v-icon>
                </div>
                <span> &ensp;</span>
                <div>
                  <p class="contactText">
                    <span style=""
                      >Gedung Atlantica, Jl. Kuningan Barat No. 7, Kec. Mampang
                      Prapatan, Kota Jakarta Selatan, Daerah Khusus Ibukota
                      Jakarta, 12710</span
                    >
                  </p>
                </div>
              </div>
              <div
                class="d-flex justify-start align-center"
                style="padding-top:10px;"
              >
                <div>
                  <v-icon small style=" text-shadow: -3px 3px 10px black;">
                    mdi-email
                  </v-icon>
                </div>
                <span> &ensp;</span>
                <div>
                  <p class="contactText">
                    <span style="">sekretariat.lsppromigas@gmail.com </span>
                  </p>
                </div>
              </div>
              <div
                class="d-flex justify-start align-center"
                style="padding-top:10px;"
              >
                <div>
                  <v-icon small style=" text-shadow: -3px 3px 10px black;">
                    mdi-phone
                  </v-icon>
                </div>
                <span> &ensp;</span>
                <div>
                  <p class="contactText">
                    <span style="">(021) 5214521 </span>
                  </p>
                </div>
              </div>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'KontakKami',

  data() {
    return {
      coordinates: {
        lat: '-6.236513960602482',
        lng: '106.82362815378674'
      }
    }
  },

  mounted() {
    window.scrollTo(0, 0)
  },

  methods: {}
}
</script>

<style lang="scss" scoped>
.contactText {
  color: black;
  margin: 0;
  font-size: 16px;
  text-align: left;
  text-shadow: -3px 3px 10px black;
}
.vBgContainer {
  // background: rgba(0, 0, 0, 0.4);
  position: relative;
  // background-image: -webkit-linear-gradient(top, transparent, #06285c);
  // background-image: linear-gradient(to bottom, transparent, #06285c);
  background-image: url('../../assets/Oil-Rig.jpg');
  background-size: cover;
  background-repeat: no-repeat;
}
.titleHeaderContent {
  border-bottom: 6px solid red;
  height: 80px;
  // background: #06125c;
  background-image: -webkit-linear-gradient(top, transparent, #06125c);
  background-image: linear-gradient(to bottom, transparent, #06125c);
}
.hTitle {
  font-family: arial-narrow;
  letter-spacing: 2px;
  color: white;
  border-bottom: 7px solid #06124e;
  padding: 10px 7px;
  text-shadow: -2px 2px 10px black;
}
</style>
