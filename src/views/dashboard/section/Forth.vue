<template>
  <v-container
    id="DashboardForthSection"
    tag="section"
    fluid
    style="padding: 0 15px; border:1px solid transparent; margin: 20px 0 0; position:relative;"
  >
    <v-row no-gutters style="font-size:21px;padding:0;margin:0; ">
      <v-col cols="12" md="8" style="padding: 15px; height:70vh;">
        <div class="d-flex justify-start align-center;">
          <h2
            style="height:40px; color: #0054b4; border-bottom:3px solid rgb(255, 128, 128); font-size:24px; width:120px; padding:0 3px; text-align:center;"
          >
            BERITA
          </h2>
          <p class="cText3">
            <router-link
              to="/pages/berita"
              style="text-decoration:none;color:red;"
            >
              <span>VIEW MORE</span>
            </router-link>
          </p>
        </div>
        <hr class="fLineHr" />
        <div
          style="margin-top:10px; width:100%; height:60vh; position:relative;"
        >
          <v-carousel
            style="z-index: 1;"
            height="100%"
            hide-delimiter-background
            show-arrows-on-hover
          >
            <v-carousel-item
              v-for="(item, i) in resultBerita"
              :key="i"
              :src="
                `${API_LINK +
                  '/uploads/' +
                  (item.file !== null
                    ? item.file
                    : '2021-08-31T22-24-31.598Z-images.png')}`
              "
            >
              <v-sheet
                color="transparent"
                style="height:100%; position:relative;"
              >
                <div
                  class="d-flex align-start justify-center flex-column"
                  style="position:absolute; padding:10px;  top:0; left:0; right:0; height:100%; background:#06125c88; z-index:1;"
                >
                  <v-hover v-slot="{ hover }">
                    <router-link
                      :to="`/pages/berita/${item.id}`"
                      :style="
                        `color:black; text-decoration:${
                          !hover ? 'none' : 'underline'
                        };`
                      "
                    >
                      <div
                        style="background:rgba(255,255,255,0.8); padding:5px 15px; border-radius:25px; font-size:24px; font-weight:500; position:relative: z-index:2;"
                      >
                        #{{ i + 1 }}. {{ item.title }}
                      </div></router-link
                    ></v-hover
                  >
                  <v-row
                    no-gutters
                    class="fill-height"
                    align="center"
                    justify="center"
                    style="width:100%; padding: 20px 80px;"
                  >
                    <!-- <div
                      class="text-h2 fMainText"
                      style="height:45vh;overflow:hidden;background:rgba(255,255,255,0.7);padding: 10px;"
                    >
                      <v-hover v-slot="{ hover }">
                        <router-link
                          :to="`/pages/berita/${item.id}`"
                          :style="
                            `color:${
                              !hover ? 'white' : 'hsl(150, 100%, 50%)'
                            };text-decoration:none;`
                          "
                        >
                          <p
                            v-html="item.body"
                            style="color:black;"
                          ></p> </router-link
                      ></v-hover>
                    </div> -->
                  </v-row>
                </div>
              </v-sheet>
            </v-carousel-item>
          </v-carousel>
        </div>
      </v-col>

      <v-col cols="12" md="4" style="padding: 15px;">
        <div class="d-flex justify-start align-center; ">
          <h2
            style="height:40px;color: #0054b4; border-bottom: 3px solid rgb(255, 128, 128); font-size:24px; width:120px; padding:0 3px; text-align:center;"
          >
            AGENDA
          </h2>
          <p class="cText3">
            <router-link
              to="/pages/agenda"
              style="text-decoration:none;color:red;"
            >
              <span>VIEW MORE</span>
            </router-link>
          </p>
        </div>
        <hr class="fLineHr" />
        <div style="margin-top:10px; height:60vh; overflow:auto;">
          <v-row
            v-for="(item, index) in resultAgenda"
            :key="index"
            no-gutters
            style="font-size:21px;padding:0 5px 0 0;margin:0; height:115px;margin-bottom:7px;"
          >
            <v-col cols="3" md="3" style="padding:0;height:100%;">
              <div
                class="d-flex flex-column justify-center align-center"
                style="height:100%; background:rgb(204, 204, 204); position:relative;"
              >
                <div
                  style="position:absolute; top:0; left:0; bottom:0; border-left:5px solid #06125c"
                ></div>
                <p
                  style="color:black;margin:0;font-size:28px; font-weight:500;line-height:20px;"
                >
                  {{ convertDay(item.start_time) }}
                </p>
                <p
                  style="color:black;margin:0;font-size:25px; font-weight:500;"
                >
                  {{ convertMonth(item.start_time) }}
                </p>
              </div>
            </v-col>
            <v-col
              cols="9"
              md="9"
              style="padding:0;height:100%; background:rgb(240, 240, 240); position:relative;"
            >
              <div style="height:100%;padding:10px;">
                <v-hover v-slot="{ hover }">
                  <router-link
                    :to="`/pages/agenda`"
                    :style="
                      `color:${
                        !hover ? 'white' : 'hsl(150, 100%, 50%)'
                      };text-decoration:none;`
                    "
                  >
                    <v-toolbar-title class="fScheduleTitle">
                      {{ item.title }}
                    </v-toolbar-title>
                  </router-link></v-hover
                >
                <p
                  style="margin: 0; font-size:14px; font-weight:300; "
                  class="d-flex justify-start align-center"
                >
                  <v-icon color="black" style="margin-right:5px;"
                    >mdi-clock-outline</v-icon
                  >
                  <span
                    >{{ convertTime(item.start_time) }} -
                    {{ convertTime(item.end_time) }} WIB</span
                  >
                </p>
                <p
                  style="margin: 0; font-size:14px; font-weight:300;"
                  class="d-flex justify-start align-center"
                >
                  <v-icon color="black" style="margin-right:5px;"
                    >mdi-map-marker</v-icon
                  >
                  <span>{{ item.location }}</span>
                </p>
              </div>
            </v-col>
          </v-row>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios'
import buildType from '../../../services/buildType'
export default {
  name: 'DashboardForthSection',

  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      items: [
        {
          title: 'BIMTEK',
          src: require('../../../assets/lsp-image/Training/TrainingID2.jpeg'),
          text: `Program Bimtek merupakan
                        <b style="color: hsl(120, 100%, 45%)">
                          program intensif
                        </b>
                        dan mengadopsi metode
                        <b style="color: hsl(120, 100%, 45%)">
                          <i>experiential learning</i>
                        </b>
                        sehingga peserta dapat
                        <b style="color: hsl(120, 100%, 45%)">
                          mengembangkan pengetahuan, keterampilan dan sikap
                          kerja
                        </b>
                        sehingga siap uji kompetensi sesuai skema kompetensi
                        yang dipilih. Kelas publik dapat diikuti berdasarkan
                        jadwal yang ditentukan.`
        },
        {
          title: 'BIMTEK ONLINE',
          src: require('../../../assets/lsp-image/bimtek/Bimolbatch9.jpeg'),
          text: `Program pelatihan berbasis kompetensi secara online
                        adalah solusi atas meningkatnya kebutuhan pengembangan
                        diri para professional. Program online diharapkan mampu
                        <b style="color: hsl(120, 100%, 45%)">
                          memacu proses transfer pengetahuan, keterampilan dan
                          sikap kerja
                        </b>
                        dengan bantuan teknologi informasi secara efisien dan
                        fleksibel tanpa mengurangi esensi pembelajaran yang ada
                        di kelas konvensional.`
        },
        {
          title: 'EXECUTIVE',
          src: require('../../../assets/lsp-image/executive_program/Executive-Program.jpeg'),
          text: `Program Executive ditawarkan sebagai solusi para
                        executive untuk mengukuhkan kompetensi yang sudah ada
                        dengan mengadopsi metode
                        <b style="color: hsl(120, 100%, 45%)">
                          mentoring </b> dan <b style="color: hsl(120, 100%, 45%)"> coaching
                        </b>
                        sehingga para executive siap uji kompetensi sesuai skema
                        kompetensi yang dipilih. Kelas executive dapat diikuti
                        secara inhouse atau private coaching.`
        },
        {
          title: 'BIMTEK INHOUSE',
          src: require('../../../assets/lsp-image/Training/TrainingPEPIDMBL.jpeg'),
          text: `Program Bimtek Inhouse merupakan
                        <b style="color: hsl(120, 100%, 45%)">
                          program intensif
                        </b>
                        dan mengadopsi metode
                        <b style="color: hsl(120, 100%, 45%)">
                          <i>experiential learning</i>
                        </b>
                        sehingga peserta dapat
                        <b style="color: hsl(120, 100%, 45%)">
                          mengembangkan pengetahuan, keterampilan dan sikap
                          kerja
                        </b>
                        sehingga siap uji kompetensi sesuai skema kompetensi
                        yang dipilih. Kelas inhouse dapat diikuti berdasarkan
                        kebutuhan perusahaan dengan jumlah minimal 15 peserta.`
        }
      ],
      colors: [
        'indigo',
        'warning',
        'pink darken-2',
        'red lighten-1',
        'deep-purple accent-4'
      ],
      slides: ['First', 'Second', 'Third', 'Fourth', 'Fifth'],
      resultAgenda: [],
      resultBerita: []
    }
  },

  mounted() {
    this.loadTable()
  },
  methods: {
    loadTable() {
      this.berita()
      this.agenda()
    },
    convertTime(raw) {
      var d = new Date(raw)
      var n = d.toLocaleTimeString()
      return n.slice(0, n.lastIndexOf(':'))
    },
    berita() {
      axios
        .get(`${this.API_LINK}/articles`)
        .then(res => {
          this.resultBerita = res.data.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    agenda() {
      axios
        .get(`${this.API_LINK}/agenda`)
        .then(res => {
          this.resultAgenda = res.data.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    convertDay(raw) {
      const date = new Date(raw).toLocaleDateString()

      const day = date.slice(0, date.indexOf('/'))
      return day
    },
    convertMonth(raw) {
      const date = new Date(raw).toLocaleDateString()

      let month = date.slice(date.indexOf('/') + 1, date.lastIndexOf('/'))

      switch (month) {
        case '01':
          month = 'JAN'
          break
        case '02':
          month = 'FEB'
          break
        case '03':
          month = 'MAR'
          break
        case '04':
          month = 'APR'
          break
        case '05':
          month = 'MAY'
          break
        case '06':
          month = 'JUN'
          break
        case '07':
          month = 'JUL'
          break
        case '08':
          month = 'AUG'
          break
        case '09':
          month = 'SEP'
          break
        case '10':
          month = 'OKT'
          break
        case '11':
          month = 'NOV'
          break
        case '12':
          month = 'DES'
          break
      }
      return month
    }
  }
}
</script>
<style lang="scss" scoped>
.fLineHr {
  background-image: -webkit-linear-gradient(left, red, transparent);
  background-image: linear-gradient(to right, red, transparent);
  border: 0;
  height: 0.5px;
  margin: 0;
}
.fScheduleTitle {
  cursor: pointer;
  width: 100%;
  color: #06125c;
  margin: 0;
  font-size: 16px;

  &:hover {
    font-weight: 400;
    color: #0b1d8f;
  }
}
.dLayout {
  z-index: 2;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: rgba(66, 0, 104, 0.2);
}

.cText3 {
  font-size: 13px;
  color: red;
  margin: auto 5px 0 auto;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  &:hover {
    text-decoration: underline;
    color: #007bff;
  }
  span:before {
    content: ' ';
    border-top: 1px solid red;
    height: 1px;
    width: 30px;
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 4px;
  }
  span:after {
    content: ' ';
    border-top: 1px solid red;
    height: 1px;
    width: 30px;
    display: inline-block;
    margin-left: 5px;
    margin-bottom: 4px;
  }
}

.fMainText {
  p {
    margin: 0;
    font-size: 24px;
    font-weight: 400;
    line-height: 35px;
  }
}
@media (max-width: 710px) {
  .fMainText {
    p {
      font-size: 20px;
      line-height: 25px;
    }
  }
}
@media (max-width: 640px) {
  .fMainText {
    p {
      font-size: 18px;
    }
  }
}
@media (max-width: 540px) {
  .fMainText {
    p {
      line-height: 20px;
      font-size: 16px;
    }
  }
}
@media (max-width: 450px) {
  .fMainText {
    p {
      width: 200px;
      font-size: 14px;
    }
  }
}
</style>
