<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="LatarBelakang"
      tag="section"
      :style="
        `width:${
          wWidth < 1225 ? '100%' : '50%'
        };padding: 0 15px;min-height:75vh; position:relative; top:-30px;background:rgba(255,255,255,0.9);`
      "
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
          <h2 class="hTitle">
            Latar Belakang
          </h2>
        </v-col>
        <v-col cols="12" style="padding:0 20px;" class="d-flex">
          <v-card
            tile
            elevation="0"
            color="transparent"
            :style="
              `margin:0;padding:15px 30px;min-height:50vh;width:${
                wWidth < 700 ? '100%' : '100%'
              };`
            "
          >
          <p
              :style="
                `text-indent: 50px;font-size:${
                  wWidth > 400 ? '16px' : '4vw'
                }; font-weight:800;margin:0; text-align:justify; width:100%;`
              "
            >
              2013 - YAPPI (Yayasan APPI Indonesia)
            </p>
            <p
              :style="
                `text-indent: 50px;font-size:${
                  wWidth > 400 ? '16px' : '4vw'
                }; font-weight:400;margin:0; text-align:justify; width:100%;`
              "
            >
              Yayasan APPI Indonesia
            didirikan sebagai wadah organisasi
            bagi para profesi di Industri Migas
            dalam memberikan sumbangsih ilmu
            pengetahuan, keahlian dan
            ketrampilan bagi tenaga profesional
            guna mendukung pembangunan
            nasional pada umumnya dan industri
            migas khususnya
            </p>
            <br />
            <p
              :style="
                `text-indent: 50px;font-size:${
                  wWidth > 400 ? '16px' : '4vw'
                }; font-weight:800;margin:0; text-align:justify; width:100%;`
              "
            >
              2020 - PT. KPMI
            </p>
            <p
              :style="
                `text-indent: 50px;font-size:${
                  wWidth > 400 ? '16px' : '4vw'
                }; font-weight:400;margin:0; text-align:justify; width:100%;`
              "
            >
              Sebagai wujud partisipasi nyata
              YAPPI maka didirikanlah badan
              hukum yang bernama
              PT. Kompetensi Profesional Migas
              Indonesia (PT. KPMI) pada bulan
              Januari 2020
            </p>
            <br />
            <p
              :style="
                `text-indent: 50px;font-size:${
                  wWidth > 400 ? '16px' : '4vw'
                }; font-weight:800;margin:0; text-align:justify; width:100%;`
              "
            >
              2020 - LPK - KPMI
            </p>
            <p
              :style="
                `text-indent: 50px;font-size:${
                  wWidth > 400 ? '16px' : '4vw'
                }; font-weight:400;margin:0; text-align:justify; width:100%;`
              "
            >
              Agar lebih terstruktur maka pada
              bulan Juni 2020 dibentuklah
              LPK - KPMI yang menjalankan
              program pelatihan dengan
              standar mutu dan didukung oleh
              certified trainer daripara praktisi
              dan tenaga ahli di Industri Migas
            </p>
          </v-card>
          <!-- <div
            v-if="wWidth > 700"
            :style="
              `margin:0;padding:15px;width:${
                wWidth < 700 ? '0' : '30%'
              };border-left:${
                wWidth > 700 ? '1px solid rgba(0,0,0,0.2)' : 'none'
              };`
            "
          >
            <profile-side-navigation />
          </div> -->
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'LatarBelakang',
  components: {
    // ProfileSideNavigation: () => import('./sideNav/Side_Nav')
  },
  data() {
    return {
      wWidth: window.innerWidth
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize)
    })
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },

  methods: {
    onResize() {
      this.wWidth = window.innerWidth
    }
  }
}
</script>
<style lang="scss" scoped>
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
