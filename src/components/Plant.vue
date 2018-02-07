<template>
<div class="plantbor" style="border: solid 2px #DEDEDE;">
  <!-- <div class="plant">
      <img class="plantimg" src="../assets/rose.jpg"  alt="Vue Logo"/>
      玫瑰（学名：Rosa rugosa Thunb.）：原产地中国。属蔷薇目，蔷薇科落叶灌木，枝杆多针刺，奇数羽状复叶，小叶5-9片，椭圆形，有边刺。花瓣倒卵形，重瓣至半重瓣，花有紫红色、白色，果期8-9月，扁球形。枝条较为柔弱软垂且多密刺，每年花期只有一次，因此较少用于育种，近来其主要被重视的特性为抗病性与耐寒性。
        玫瑰作为经济作物时，其花朵主要用于食品及提炼香精玫瑰油，玫瑰油应用于化妆品、食品、精细化工等工业。在欧洲诸语言中，蔷薇、玫瑰、月季都是使用同一个词，如英语是rose，德语是Die Rose。玫瑰是英国的国花，也是中国吉林省吉林市的市花。通俗意义中的“玫瑰”已成为多种蔷薇属植物的通称。且事实上杂交玫瑰也是由蔷薇属下各物种杂交选育所产生。此内容请看“玫瑰花”一词。
  </div> -->
  <div class="plant" >
      <img class="plantimg" v-bind:src="planti.imgsrc.split(',',1)"  alt="Vue Logo"/><p>{{planti.plantinfo}}</p>
  </div>
  </div>
</template>
<script>
export default {
  props: {
    planti: {
      name: '',
      chandi: '',
      gardencode: '',
      mu: '',
      ke: '',
      shu: '',
      zhong: '',
      plantinfo: '',
      xixing: '',
      imgname: '',
      imgsrc: ''
    }
  },
  data () {
    return {
      //   plantinfo: {
      //     imgsrc: '',
      //     imginfo: ''
      //   }
    }
  }

//   mounted: function () {
//     this.imgsrc = this.planti.imgsrc.split(',', 1)
//   }
}
</script>

<style>
.plant:hover {
  color: #fff;
  background: #78968a;
}
.plant:hover .plantimg {
  -webkit-transform: rotatex(25deg);
  -moz-transform: rotatex(25deg);
}
.plant {
  /* width: 300px; */
  height: 200px;
  /* width:1150px; */
  /* margin: 0 auto; */
  border-radius: 50px;
  padding:1px;
  transition: all 1.5s;
  word-break: break-word;
  font-size:18px;
  font-family: Georgia;
  /* background-color: rgb(201, 200, 183); */

}
.plant{
    padding:0px 15px;
    /* width:1 */
}
.plantbor {
  /* height: 200px; */
  margin-left:50px;
  width:1150px;
  border-radius: 50px;
  word-break: break-word;
}
.plantinfo {
    float: left;
  border-radius: 50px;
  word-break: break-word;
}
.plant p{
    width:1050px;
}
.plantimg {
  width: 340px;
  height: 190px;
  padding: 5px;
  transition: all 1.5s;
  /* background-color: darkgreen; */
  border-radius: 50px;
  float: left;
}
</style>
