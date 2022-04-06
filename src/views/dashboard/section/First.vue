<template>
  <v-container
    id="dashboardFirstSection"
    fluid
    tag="section"
    style="height:72vh;padding:0;"
  >
    <v-row no-gutters style="height:100%;">
      <v-col cols="12" style="height:100%; position:relative;">
        <v-carousel
          @change="carousel"
          style="z-index: 1;"
          height="100%"
          hide-delimiter-background
          show-arrows-on-hover
        >
          <v-carousel-item
            transition="scroll-x-transition"
            v-for="(item, i) in items"
            :key="i"
            :src="item.src"
            style="width:100%;height:100%;"
          >
            <!-- <v-sheet color="transparent" height="100%">
              <v-row class="fill-height" align="center" justify="center">
                <div
                  style="position:relative; z-index:4px; font-weight:bolder; color:white;font-size:46px; width:50%;text-shadow: -3px 3px 5px black;"
                >
                  Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                  Ipsum, quam.
                </div>
              </v-row>
            </v-sheet> -->
          </v-carousel-item>
          <template v-slot:prev="{ on, attrs }">
            <div id="iPrev" v-bind="attrs" v-on="on"></div>
          </template>
          <template v-slot:next="{ on, attrs }">
            <div id="iNext" v-bind="attrs" v-on="on"></div>
          </template>
        </v-carousel>
        <div class="dLayout"></div>
        <div class="rLayout">
          <v-btn
            large
            class="ma-2"
            text
            icon
            color="white"
            style="margin-left: 15px;"
            @click="prev"
          >
            <v-icon color="white">mdi-chevron-left</v-icon>
          </v-btn>
          <div class="cText-2" v-if="carouselIndex == 0">
            <div v-if="carouselIndex == 0">
              <p class="cText1-2" style="margin:0;text-transform:uppercase;">
                <span style="color:black;text-shadow: -3px 3px 5px white;">
                  Selamat datang di website kami
                </span>
                <!-- <br />
                <span style="font-size:26px;">
                  Lembaga Sertifikasi Profesional migas indonesia<br />(LSP
                  Promigas Indonesia)
                </span> -->
              </p>
              <p class="cText2-2">
                Lembaga Pelatihan Kerja Kompetensi Profesional Migas Indonesia<br />(LPK - KPMI)
              </p>
            </div>
            <!-- <router-link class="cButton" to="/pages/kontak">
              <v-btn rounded color="hsl(103, 90%, 45%)">
                Hubungi Kami
              </v-btn>
            </router-link> -->
          </div>
          <div class="cText" v-if="carouselIndex == 1">
            <div>
              <div class="cTextDiv1"></div>
              <p
                class="cText1"
                style="line-height:55px; margin:0;color:black;text-shadow: -3px 3px 5px white;text-transform:uppercase;"
              >
                Tentang <br />
                Kami
              </p>
              <div class="cText2" style="text-align:justify;">
                <p style="margin:0;">
                  Lembaga Pelatihan Kerja Kompetensi Profesional Migas Indonesia (LPK-KPMI) adalah lembaga pelatihan kerja yang didirikan oleh YAPPI untuk memenuhi kebutuhan pengembangan kompetensi professional di Kegiatan Usaha Hulu Migas .

Program Kerja dari LPK-KPMI adalah melaksanakan pelatihan-pelatihan berbasis kompetensi untuk mempersiapkan peserta maju  Uji Kompetensi maupun pelatihan teknis lainnya, mendukung program pemerintah mewujudkan Indonesia Kompeten.
                </p>
                <!-- <p style="margin:8px 0 0 0;">
                  Lembaga Sertifikasi yang kredibel dan terpercaya dalam
                  menjamin kompetensi profesional Industri Minyak dan Gas Bumi
                  yang telah mendapatkan Lisensi dari Badan Nasional Sertifikasi
                  Profesi (BNSP) dan diakui secara nasional maupun internasiona.
                </p> -->
              </div>
            </div>
          </div>
          <div class="cText-3" v-if="carouselIndex == 2">
            <div>
              <div
                class="cTextDiv1-3"
                style="top: -25px; border-radius: 25px 0 0 0;background:red;opacity:0.5;"
              ></div>
              <p class="cText1-3" style="margin:0;">
                <span
                  style="color:black;text-shadow: -3px 3px 5px white;text-transform:uppercase;"
                >
                  Maju bersama</span
                >
                <br />
                LPK - KPMI
                <br />
                <span> menuju Indonesia Kompeten</span>
              </p>
            </div>
          </div>

          <v-btn
            @click="next"
            large
            class="ma-2"
            text
            icon
            color="white"
            style="margin-right: 15px;"
          >
            <v-icon color="white">mdi-chevron-right</v-icon>
          </v-btn>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'DashboardFirstSection',

  data() {
    return {
      carouselIndex: 0,
      items: [
        {
          src: require('../../../assets/lsp-image/cover/CoachingMBL.jpeg')
        },
        {
          src: require('../../../assets/lsp-image/cover/TrainingLWPSS.jpeg')
        },
        {
          src: require('../../../assets/lsp-image/cover/TrainingPEPIDMBL.jpeg')
        }
      ]
    }
  },

  methods: {
    carousel(pItem) {
      this.carouselIndex = pItem
    },
    prev() {
      document.getElementById('iPrev').click()
      // if (this.carouselIndex > 0) {
      //   this.carouselIndex -= 1
      // } else {
      //   this.carouselIndex = 2
      // }
      // console.log(this.carouselIndex)
    },
    next() {
      document.getElementById('iNext').click()
      // if (this.carouselIndex < 2) {
      //   this.carouselIndex += 1
      // } else {
      //   this.carouselIndex = 0
      // }
      // console.log(this.carouselIndex)
    }
  }
}
</script>
<style lang="scss" scoped>
.dLayout {
  z-index: 2;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: rgba(66, 0, 104, 0.3);
}
.rLayout {
  z-index: 3;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.cText {
  margin: 0;
  width: 750px;
  font-weight: bolder;
  color: white;
  text-shadow: -3px 3px 5px black;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;

  .cText1 {
    font-size: 46px;
    position: relative;
    z-index: 2;
  }

  .cText2 {
    font-size: 21px;
    color: white;
    margin: 0;
    position: relative;
    z-index: 2;
    width: 100%;
  }

  .cButton {
    margin-top: 40px;
    margin-left: auto;
  }
  .cTextDiv1 {
    width: 100px;
    height: 100px;
    background: hsla(104, 85%, 60%, 0.5);
    position: absolute;
    top: -15px;
    left: -35px;
    z-index: 1;
    border-radius: 25px 0 0 0;
  }
}
.cText-2 {
  text-align: center;
  margin: 0;
  font-weight: bolder;
  color: white;
  text-shadow: -3px 3px 5px black;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;

  .cText1-2 {
    font-size: 46px;
    position: relative;
    z-index: 2;
  }
  .cText2-2 {
    font-size: 32px;
    color: white;
    margin: 0;
    position: relative;
    z-index: 2;
    width: 100%;
  }
}
.cText-3 {
  margin: 0;
  font-weight: bolder;
  color: white;
  text-shadow: -3px 3px 5px black;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;

  .cText1-3 {
    font-size: 46px;
    position: relative;
    z-index: 2;
  }

  .cText2-3 {
    font-size: 21px;
    color: white;
    margin: 0;
    position: relative;
    z-index: 2;
    width: 100%;
  }

  .cTextDiv1-3 {
    width: 100px;
    height: 100px;
    background: hsla(104, 85%, 60%, 0.5);
    position: absolute;
    top: -15px;
    left: -35px;
    z-index: 1;
    border-radius: 25px 0 0 0;
  }
}
@media (max-width: 960px) {
  .cText {
    width: 70%;
    .cText1 {
      font-size: 36px;
    }

    .cText2 {
      font-size: 18px;
      width: 100%;
    }
  }
  .cText-2 {
    width: 100%;
    .cText1-2 {
      font-size: 36px;
    }
    .cText2-2 {
      font-size: 24px;
    }
  }
  .cText-3 {
    width: 70%;
    .cText1-3 {
      font-size: 36px;
    }
    .cText2-3 {
      font-size: 18px;
      color: white;
      margin: 0;
      position: relative;
      z-index: 2;
      width: 100%;
    }
  }
}
@media (max-width: 600px) {
  .cText {
    .cText1 {
      font-size: 36px;
    }

    .cText2 {
      font-size: 14px;
      width: 100%;
    }
  }
  .cText-2 {
    .cText1-2 {
      font-size: 26px;
    }
    .cText2-2 {
      font-size: 18px;
    }
  }
  .cText-3 {
    .cText1-3 {
      font-size: 36px;
    }
  }
}
@media (max-width: 410px) {
  .cText {
    .cText2 {
      font-size: 12px;
    }
  }
}
</style>
