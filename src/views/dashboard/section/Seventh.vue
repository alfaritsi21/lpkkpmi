<template>
  <div class="DashboardSeventhSection">
    <v-container
      id="DashboardSeventhSection"
      tag="section"
      style="padding: 0 15px; margin-bottom:20px;position:relative;"
    >
      <v-row
        align="center"
        no-gutters
        style="font-size:18px; padding:0; margin:0;;"
      >
        <v-col class="cColTitle" cols="12">
          <div class="cColDiv"></div>
          <p class="cColText" style="line-height:35px; margin:0;">
            Jasa Kami
          </p>
          <hr />
          <!-- <div
            style="background:red; height:40px; width:100px; margin-left:auto; position:relative;"
          >
            <v-icon class="sIcon" large>mdi-alpha-s-circle-outline</v-icon>
          </div> -->
        </v-col>

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
                  <!-- <v-img
                    style="position:absolute; top:0; left:0; right:0; height:100%; width:100%;"
                    :src="scheme[index].pict"
                  >
                    <template v-slot:placeholder>
                      <v-row
                        class="fill-height ma-0"
                        align="center"
                        justify="center"
                      >
                        <v-progress-circular
                          indeterminate
                          color="hsl(104, 100%, 70%)"
                        ></v-progress-circular>
                      </v-row>
                    </template>
                  </v-img>
                  <v-icon
                    color="hsl(104, 100%, 70%)"
                    style="background:#06125c;position:absolute;top:2px; left:2px; border:2px solid hsl(104, 100%, 40%); padding:2px 4px;"
                    >mdi-alpha-i-circle-outline</v-icon
                  > -->
                  <v-card
                    elevation="4"
                    class="d-flex justify-center align-center"
                    style="font-size:16px; color:hsl(243, 80%, 35%); font-weight:bold; height:90%; width:90%; border:2px solid hsl(150, 100%, 50%);margin:auto; background:rgba(255,255,255,0.7); border-radius:10px;"
                  >
                    <p style="margin:0;">{{ scheme[index].text }}</p>
                  </v-card>
                </div>
              </div>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
      <!-- <router-link to="/pages/skema-sertifikasi">
        <p class="tTextLink">
          <span>VIEW MORE</span>
        </p>
      </router-link>
      <hr /> -->
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardSeventhSection',

  data() {
    return {
      model: null,
      scheme: [
        {
          text: 'Pelatihan Berbasis Kompetensi',
          icon: 'mdi-book-open-page-variant',
          pict: require('../../../assets/pict/20945985.jpg')
        },
        {
          text: 'Mentoring Program',
          icon: 'mdi-book-open-page-variant',
          pict: require('../../../assets/pict/20945999.jpg')
        },
        {
          text: 'Coaching Program',
          icon: 'mdi-book-open-page-variant',
          pict: require('../../../assets/pict/4579608.jpg')
        },
        {
          text: 'Jasa Konsultasi Bidang Profesi di Industri Migas',
          icon: 'mdi-book-open-page-variant',
          pict: require('../../../assets/pict/20943572.jpg')
        },
        {
          text: 'Klaster Pelaksanaan Kontrak Mitra Kerja',
          icon: 'mdi-book-open-page-variant',
          pict: ''
        },
        {
          text: 'Klaster Pengelolaan Sistem Manajemen K3LL',
          icon: 'mdi-book-open-page-variant',
          pict: ''
        },
        {
          text: 'Klaster Pengelolaan Formalitas Kepabeanan',
          icon: 'mdi-book-open-page-variant',
          pict: ''
        },
        {
          text: 'Klaster Pendamping HR Business Prartner',
          icon: 'mdi-book-open-page-variant',
          pict: ''
        }
      ]
    }
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.DashboardSeventhSection {
  background-image: -webkit-linear-gradient(top, #0054b4, transparent);
  background-image: linear-gradient(to bottom, #0054b4, transparent);
  // .sIcon {
  //   padding: 3px;
  //   width: 40px;
  //   height: 40px;
  //   position: absolute;
  //   background-image: -webkit-linear-gradient(
  //     left,
  //     hsl(104, 100%, 40%),
  //     transparent
  //   );
  //   background-image: linear-gradient(
  //     to right,
  //     hsl(104, 100%, 40%),
  //     transparent
  //   );
  //   top: 0;
  //   left: 0;
  //   color: white;
  // }
  #DashboardSeventhSection {
    background-image: -webkit-linear-gradient(bottom, white, transparent);
    background-image: linear-gradient(to top, white, transparent);
  }
}
.tInfoDiv {
  font-size: 18px;
  font-weight: 300;
  color: #06125c;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  // padding: 30px 10px;
  div {
    width: 100%;
    padding: 0 30px;
    p {
      text-align: center;
      width: 100%;
      line-height: 20px;
      margin: auto;
    }
  }
}
hr {
  background-image: -webkit-linear-gradient(
    left,
    transparent,
    #c2c2c2,
    transparent
  );
  background-image: linear-gradient(
    to right,
    transparent,
    #c2c2c2,
    transparent
  );
  border: 0;
  height: 1px;
  margin: 5px 0;
}
.tTextLink {
  font-size: 13px;
  color: red;
  font-weight: bold;
  margin: 0 5px 0 0;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    text-decoration: underline;
    color: #007bff;
  }
  span:before {
    content: ' ';
    border-top: 1px solid red;
    height: 1px;
    width: 50px;
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 4px;
  }
  span:after {
    content: ' ';
    border-top: 1px solid red;
    height: 1px;
    width: 50px;
    display: inline-block;
    margin-left: 5px;
    margin-bottom: 4px;
  }
}

.cColText {
  font-size: 36px;
  position: relative;
  z-index: 2;
  color: #004797;
  text-shadow: -3px 3px 12px white;
  font-weight: bold;
}
.cColDiv {
  width: 100px;
  height: 100%;
  background: hsla(104, 100%, 60%, 0.486);
  position: absolute;
  top: -30px;
  left: -60px;
  z-index: 1;
  border-radius: 25px 0 0 0;
}

.cColTitle {
  padding: 10px 0;
  margin-bottom: 10px;
  border-right: none;
  border-left: none;
  position: relative;

  hr {
    background-image: -webkit-linear-gradient(right, red, transparent);
    background-image: linear-gradient(to left, red, transparent);
    border: 0;
    height: 2px;
    margin: 0;
  }
}
</style>
