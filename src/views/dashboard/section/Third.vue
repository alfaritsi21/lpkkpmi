<template>
  <div style="position:relative;">
    <div class="tHeadLine">
      <p style="margin:0;font-weight:bold;">
        Program Kami (Metode Pelatihan)
      </p>
    </div>
    <div class="dotsBg"></div>
    <v-container id="dashboardThirdSection" tag="section">
      <div>
        <div class="tInfoDiv">
            <div
              style="background:transparent; width:100%; height:100%; position:absolute; top:0; left:0;z-index:1;"
            ></div>
            <h1 style="font-size:23px; text-align:center;margin-bottom:10px;">Pengetahuan (Knowledge)</h1>
            <p style="text-align:justify;">Menguasai SKKNI serta peraturan perundangan
            terkait lainnya sesuai bidang profesi di Industri
            Migas yang terkini
            </p>
        </div>
        <div class="tInfoDiv">
            <div
              style="background:transparent; width:100%; height:100%; position:absolute; top:0; left:0;z-index:1;"
            ></div>
            <h1 style="font-size:23px; text-align:center;margin-bottom:10px;">Keterampilan (Skill)</h1>
            <p style="text-align:justify;">Skilltransfer & Best Practices melalui kegiatan
              studi kasus, diskusi dan roleplay.
            </p>
          </div>
          <div class="tInfoDiv">
            <div
              style="background:transparent; width:100%; height:100%; position:absolute; top:0; left:0;z-index:1;"
            ></div>
            <h1 style="font-size:23px; text-align:center;margin-bottom:10px;">Sikap Kerja (Attitude)</h1>
            <p style="text-align:justify;">Mentoring dan Coaching program diberikan selama
              pelatihan berlangsung.
            </p>
          </div>
      </div>
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
