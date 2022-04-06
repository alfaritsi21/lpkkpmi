<template>
  <div style="">
    <div class="tHeadLine"></div>
    <v-container id="DashboardForthSection" fluid tag="section">
      <v-row
        align="center"
        no-gutters
        style="font-size:21px;height:100%;width:100%;position:relative;"
      >
        <div class="dotsBg"></div>
        <v-col class="fCol" cols="6" style="height:100%">
          <v-img
            style="position:absolute; top:0; left:0; right:0; height:150%"
            src="../../../assets/Oil-Rig.jpg"
            aspect-ratio="1.7"
            :contain="false"
          >
            <div class="dLayout"></div>
          </v-img>
          <div
            style="width:45px;height:30%; background:#0054b4; position:absolute;top:0; right:0;z-index:2;padding:0;"
          >
            <v-icon
              x-large
              style="padding:3px; width:45px; height:45px;position:absolute; background:#4caf50; bottom:0; right:0;"
              color="white"
              >mdi-web</v-icon
            >
          </div>
        </v-col>
        <v-col cols="6" class="fCol">
          <div class="cText">
            <!-- <div class="cTextDiv1"></div> -->
            <p class="cText1" style="margin:0;">
              Seputar LPK - KPMI
            </p>
            <hr />
            <p class="cText2">
              Lembaga Pelatihan Kerja
              Pertama di Industri Migas
              yang memperoleh
              Akreditasi “B” yang
              dikeluarkan oleh Komisi
              Akreditasi LDP ESDM
            </p>
            <!-- <p class="cText3">
            <span>VIEW DETAIL</span>
          </p> -->
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardForthSection',

  data() {
    return {}
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.dotsBg {
  background-image: url('../../../assets/pict/dots-bg.png');
  opacity: 0.5;
  height: 300px;
  width: 260px;
  position: absolute;
  top: 0;
  right: 0;
}
#DashboardForthSection {
  padding: 0;
  height: 40vh;
  background: #0054b4;
  // background-image: -webkit-linear-gradient(top, transparent, #0054b4);
  // background-image: linear-gradient(to bottom, transparent, #0054b4);
}
.tHeadLine {
  height: 35px;
  background-image: -webkit-linear-gradient(top, transparent, #0054b4);
  background-image: linear-gradient(to bottom, transparent, #0054b4);
  // background:#06125c;
  text-align: center;
  color: white;
  font-size: 24px;
}
.dLayout {
  z-index: 2;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  // background: rgba(66, 0, 104, 0.1);
}
.fCol {
  height: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  position: relative;
}
.cText {
  margin: 0;
  width: 390px;
  font-weight: bolder;
  color: white;
  text-shadow: -3px 3px 12px white;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  padding-left: 30px;
  .cText1 {
    width: 450px;
    font-size: 36px;
    position: relative;
    z-index: 2;
    color: white;
  }
  .cText2 {
    line-height: 25px;
    font-size: 16px;
    color: black;
    font-weight: 600;
    margin: 0;
    margin-bottom: 15px;
  }
  // .cText3 {
  //   font-size: 13px;
  //   color: red;
  //   margin: 0 5px 0 0;
  //   cursor: pointer;
  //   display: flex;
  //   align-items: center;
  //   justify-content: flex-end;
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
  // }
}
// .cTextDiv1 {
//   width: 100px;
//   height: 100px;
//   background: #4caf50 hsl(104, 85%, 40%);
//   position: absolute;
//   top: -15px;
//   left: -35px;
//   z-index: 1;
//   border-radius: 25px 0 0 0;
// }

@media (max-width: 960px) {
  .cText {
    margin: 0;
    width: 100%;
    padding-left: 10px;
    .cText1 {
      width: 100%;
      font-size: 26px;
    }
  }
}
@media (max-width: 600px) {
  .cText {
    .cText1 {
      font-size: 21px;
    }
    .cText2 {
      font-size: 14px;
    }
  }
}
@media (max-width: 440px) {
  .cText {
    .cText1 {
      font-size: 18px;
    }
    .cText2 {
      font-size: 12px;
      margin: 0;
    }
    // .cText3 {
    //   font-size: 10px;
    //   margin: 0 10px 0 0;
    //   &:hover {
    //     text-decoration: underline;
    //     color: #007bff;
    //   }
    //   span:before {
    //     width: 30px;
    //   }
    // }
  }
}
@media (max-width: 330px) {
  .cText {
    .cText1 {
      font-size: 14px;
    }
    .cText2 {
      line-height: 20px;
    }
    // .cText3 {
    //   &:hover {
    //     text-decoration: underline;
    //     color: #007bff;
    //   }
    //   span:before {
    //     width: 30px;
    //   }
    // }
  }
}
</style>
