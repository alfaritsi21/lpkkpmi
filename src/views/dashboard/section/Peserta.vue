<template>
  <div style="position:relative;">
    <div class="tHeadLine">
      <p style="margin:0;font-weight:bold;">
        Program Kami (Metode Pelatihan)
      </p>
    </div>
    <div class="dotsBg"></div>
    <v-container id="dashboardPesertaSection" tag="section">
      <v-row
        align="center"
        no-gutters
        style="font-size:18px; padding:0; margin:0;;"
      >
        <v-col cols="12" style="padding:0;">
          <v-row no-gutters style="padding:0;">
            <v-col
              v-for="(item, index) in 4"
              :key="index"
              cols="12"
              md="3"
              style="min-height:25vh;padding:0;"
            >
              <div class="tInfoDiv">
                <div
                  style="position:relative; width:100%; height:150px; margin-bottom:15px; padding:15px;"
                >
                <p>a</p>
                  <!-- <v-card
                    elevation="4"
                    class="d-flex justify-center align-center"
                    style="font-size:16px; color:hsl(243, 80%, 35%); font-weight:bold; height:90%; width:90%; border:2px solid hsl(150, 100%, 50%);margin:auto; background:rgba(255,255,255,0.7); border-radius:10px;"
                  >
                    <p style="margin:0;">{{ scheme[index].text }}</p>
                  </v-card> -->
                </div>
              </div>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
      <hr />
    </v-container>
  </div>
</template>

<script>
import axios from 'axios'
import buildType from '../../../services/buildType'
export default {
  name: 'DashboardThirdSection',

  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      totalSkema: 0,
      totalAsesor: 0,
      totalAsesi: 0,
      totalTuk: 0,
      page: 1,
      limit: 1
    }
  },
  mounted() {
    this.loadData()
  },

  methods: {
    loadData() {
      this.asesor()
      this.skema()
      this.tuk()
      this.asesi()
    },
    asesor() {
      axios
        .get(`${this.API_LINK}/asesor?page=${this.page}&limit=${this.limit}`)
        .then(res => {
          this.totalAsesor = res.data.data.pageInfo.totalData
        })
        .catch(err => {
          console.log(err)
        })
    },
    skema() {
      axios
        .get(`${this.API_LINK}/skema?page=${this.page}&limit=${this.limit}`)
        .then(res => {
          this.totalSkema = res.data.data.pageInfo.totalData
        })
        .catch(err => {
          console.log(err)
        })
    },
    asesi() {
      axios
        .get(`${this.API_LINK}/asesi?page=${this.page}&limit=${this.limit}`)
        .then(res => {
          this.totalAsesi = res.data.data.pageInfo.totalData
        })
        .catch(err => {
          console.log(err)
        })
    },
    tuk() {
      axios
        .get(`${this.API_LINK}/tuk?page=${this.page}&limit=${this.limit}`)
        .then(res => {
          this.totalTuk = res.data.data.pageInfo.totalData
        })
        .catch(err => {
          console.log(err)
        })
    },
    skemaClicked(val) {
      switch (val) {
        case 1:
          this.$router.push('/pages/skema-sertifikasi')
          break

        case 2:
          this.$router.push('/pages/asesor')
          break

        case 3:
          this.$router.push('/pages/pemegang-sertifikat')
          break

        case 4:
          this.$router.push('/pages/tuk')
          break
      }
    }
  }
}
</script>
<style lang="scss" scoped>
#DashboardThirdSection {
  padding: 0px 20px;
  margin-bottom: 20px;
  position: relative;
}
.dotsBg {
  background-image: url('../../../assets/pict/dots-bg.png');
  opacity: 0.5;
  height: 250px;
  width: 180px;
  position: absolute;
  bottom: 0;
  left: 20px;
}
.tHeadLine {
  background-image: -webkit-linear-gradient(
    left,
    transparent,
    #0054b4,
    transparent
  );
  background-image: linear-gradient(
    to right,
    transparent,
    #0054b4,
    transparent
  );
  // background:#06125c;
  text-align: center;
  color: white;
  font-size: 27px;
}
.tInfoDiv {
  position: relative;
  // cursor: pointer;
  margin: 20px 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 21px;
  font-weight: 400;
  color: #06125c;
  height: 100px;
  .tInfoIcon {
    color: #06125c;
  }
  // &:active {
  //   text-shadow: 1px 1px 5px rgba(16, 23, 56, 0.808);
  //   p {
  //     text-decoration: none;
  //   }
  // }
  // &:hover {
  //   color: #3a48a5;
  //   .tInfoIcon {
  //     color: #3a48a5;
  //   }
  //   p {
  //     text-decoration: underline;
  //   }
  // }

  p {
    margin: 0;
  }
}
hr {
  background-image: -webkit-linear-gradient(right, red, transparent);
  background-image: linear-gradient(to left, red, transparent);
  border: 0;
  height: 2px;
  margin: 5px 0;
}
// .tTextLink {
//   font-size: 13px;
//   color: red;
//   font-weight: bold;
//   margin: 0 5px 0 0;
//   cursor: pointer;
//   display: flex;
//   align-items: center;
//   justify-content: center;
//   &:hover {
//     text-decoration: underline;
//     color: #007bff;
//   }
//   span:before {
//     content: ' ';
//     border-top: 1px solid red;
//     height: 1px;
//     width: 50px;
//     display: inline-block;
//     margin-right: 5px;
//     margin-bottom: 4px;
//   }
//   span:after {
//     content: ' ';
//     border-top: 1px solid red;
//     height: 1px;
//     width: 50px;
//     display: inline-block;
//     margin-left: 5px;
//     margin-bottom: 4px;
//   }
// }
</style>
