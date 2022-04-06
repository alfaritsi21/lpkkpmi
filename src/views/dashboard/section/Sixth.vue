<template>
  <div>
    <v-container
      id="DashboardSixthSection"
      tag="section"
      style="padding: 0 15px;position:relative;"
    >
      <div class="dotsBg"></div>
      <div class="dotsBg2"></div>
      <div class="cColTitle">
        <div class="cColDiv"></div>
        <div class="tHeadLine">
          <p class="cColText" style="line-height:35px; margin:0;">
            GALLERY
          </p>
        </div>
        <hr />
      </div>
      <v-row
        align="center"
        style="font-size:21px; padding:5px 15px 15px 0; margin:0;"
      >
        <v-col
          v-for="(n, i) in img"
          :key="i"
          class="d-flex child-flex"
          cols="4"
          style="padding:5px;"
        >
          <v-img
            :src="n.pict"
            :lazy-src="`https://picsum.photos/10/6?image=${15 * 5 + 10}`"
            aspect-ratio="1.4"
            class="grey lighten-2"
          >
            <template v-slot:placeholder>
              <v-row class="fill-height ma-0" align="center" justify="center">
                <v-progress-circular
                  indeterminate
                  color="grey lighten-5"
                ></v-progress-circular>
              </v-row>
            </template>
          </v-img>
        </v-col>
      </v-row>
      <router-link to="/pages/gallery" style="position:relative; z-index:2;">
        <p class="tTextLink">
          <span>VIEW MORE</span>
        </p>
      </router-link>
      <hr />
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardSixthSection',

  data() {
    return {
      img: [
        {
          pict: require('../../../assets/lsp-image/coaching/CoachingID1.jpeg')
        },
        {
          pict: require('../../../assets/lsp-image/program_khusus/Training-SKK.jpeg')
        },
        {
          pict: require('../../../assets/lsp-image/Training/TrainingLW5.jpeg')
        },
        {
          pict: require('../../../assets/lsp-image/Training/TrainingLW3.jpeg')
        },
        {
          pict: require('../../../assets/lsp-image/Training/TrainingIDESMSM-1.jpeg')
        },
        {
          pict: require('../../../assets/lsp-image/bimtek/Bimolbatch9.jpeg')
        }
      ]
    }
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.dotsBg {
  background-image: url('../../../assets/pict/dots-bg.png');
  opacity: 0.5;
  height: 250px;
  width: 260px;
  position: absolute;
  top: -50px;
  left: -40px;
}
.dotsBg2 {
  background-image: url('../../../assets/pict/dots-bg.png');
  opacity: 0.5;
  height: 250px;
  width: 260px;
  position: absolute;
  bottom: -30px;
  right: -50px;
}
.tHeadLine {
  // background-image: -webkit-linear-gradient(left, #0054b4, transparent);
  // background-image: linear-gradient(to right, #0054b4, transparent);
  // background:#06125c;
  text-align: left;
  font-size: 24px;
  padding-left: 20px;
}

.cColTitle {
  padding: 10px 0 0;
  border-right: none;
  border-left: none;
  position: relative;

  .cColText {
    color: #0054b4;
    font-size: 26px;
    position: relative;
    z-index: 2;
    font-weight: bold;
  }
  .cColDiv {
    width: 80px;
    height: 79%;
    background: hsla(104, 100%, 40%, 0.5);
    position: absolute;
    top: 0;
    left: -30px;
    z-index: 1;
  }

  hr {
    background-image: -webkit-linear-gradient(left, red, transparent);
    background-image: linear-gradient(to right, red, transparent);
    border: 0;
    height: 2px;
    margin: 0;
  }
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
</style>
