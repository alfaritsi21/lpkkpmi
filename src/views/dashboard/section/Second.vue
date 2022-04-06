<template>
  <div class="sContainer">
    <div class="sTitleDiv">
      <h4>
        BERITA &<br />
        INFORMASI
        <v-icon
          large
          style="z-index:2; position:absolute; padding:3px; background:#4caf50; top:0; right:0;"
          color="white"
          >mdi-newspaper-variant-outline</v-icon
        >
      </h4>
    </div>
    <v-container id="dashboardSecondSection" tag="section">
      <!-- <v-row style="width:20%"> -->
      <div class="sTitleDiv2"></div>
      <!-- </v-row> -->
      <v-row no-gutters align="center" class="sRow">
        <v-col class="sNewsTitleMobile" cols="12">
          <h4>
            BERITA & <br />
            INFORMASI
            <v-icon
              large
              style="position:absolute; padding:3px; background:#4caf50; top:0; right:0;"
              color="white"
              >mdi-newspaper-variant-outline</v-icon
            >
          </h4>
        </v-col>
        <v-col
          v-for="(item, index) in 4"
          :key="index"
          cols="12"
          md="3"
          style="padding:0 10px;overflow:hidden;"
        >
          <base-material-card color="white" tile class="sCardNews">
            <template v-slot:image>
              <v-img
                src="../../../assets/lsp-image/coaching/CoachingID1.jpeg"
                :lazy-src="`https://picsum.photos/10/6?image=${1 * 5 + 10}`"
                aspect-ratio="1.4"
                class="grey lighten-2"
                style="height:170px;border-radius:3px;"
              ></v-img>
            </template>
            <h4 class=" font-weight-light ">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi,
              officiis?
            </h4>

            <template v-slot:actions>
              <v-icon class="mr-1" small>
                mdi-clock-outline
              </v-icon>
              <span class="text-caption grey--text font-weight-light"
                >updated 10 minutes ago</span
              >
            </template>
          </base-material-card>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardSecondSection',

  data() {
    return {}
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.sContainer {
  // background-image: -webkit-linear-gradient(left, transparent, #06125c, transparent);
  // background-image: linear-gradient(to right, transparent, #06125c, transparent);
  background: #06125c;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: row;

  .sTitleDiv {
    position: relative;
    width: 20%;
    margin: 0;
    font-size: 24px;
    color: black;
    background: white;

    h4 {
      color: #0054b4;
      text-align: right;
      top: -30px;
      position: relative;
      background: white;
      width: 100%;
      padding: 5px 70px 5px 20px;
    }
  }

  .sTitleDiv2 {
    display: none;
  }
  #dashboardSecondSection {
    padding: 20px 0;
    margin: 0;
    width: 80%;
    position: relative;
    right: 30px;
    display: flex;
    flex-direction: column;
    .sRow {
      padding-right: 0;
      width: 100%;
      .sNewsTitleMobile {
        display: none;
      }
      .sCardNews {
        position: relative;
        right: 0px;
      }
    }
  }
}
@media (max-width: 960px) {
  .sContainer {
    flex-direction: column;

    .sTitleDiv {
      display: none;
    }
    .sTitleDiv2 {
      display: inline-block;
      background: white;
      width: 20%;
    }
    #dashboardSecondSection {
      width: 100%;
      right: 0;
      padding: 0;
      flex-direction: row;
      .sRow {
        width: 80%;
        padding-right: 20px;
        .sNewsTitleMobile {
          position: relative;
          display: inline-block;
          font-size: 21px;
          padding: 0 40px 0 0;
          h4 {
            color: black;
            background: white;
            height: 100px;
            padding: 10px 0;
            position: relative;
          }
        }
        .sCardNews {
          position: relative;
          right: 30px;
          top: -30px;
        }
      }
    }
  }
}
</style>
