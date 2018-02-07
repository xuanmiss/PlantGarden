<template>
<div>
  <div v-for="plant in plants" :key="plant.id" v-on:click="getPlantInfo(plant.id)">
      <plant  v-bind:planti="plant"></plant>
      <!-- <div class="plant">
      <img class="plantimg" :src="plant.src" alt="Vue Logo"/>{{plant.info}}
    </div> -->

  </div>
  <mplantinfo ref="childplant"></mplantinfo>
</div>
</template>

<script>
import plant from '../components/Plant.vue'
import mplantinfo from './plant/PlantInfo.vue'
// import hub from '../components/hub.vue'
export default {
  components: {
    plant,
    mplantinfo
  },
  props: {
    gardencode: ''
  },
  data () {
    return {
      plants: []

    }
  },
  mounted: function () {
    this.plantList()
  },
  methods: {
    plantList: function (code) {
      let self = this
      self.$axios.get('/api/plant/getGardenPlants', { params: { gardencode: code } }).then(function (res) {
        if (res.data.code) {
          self.plants = res.data.data
        }
      })
    },
    getPlantInfo: function (id) {
      let self = this
    //   this.$router.push('/plant/plantInfo')
      self.$refs.childplant.getInfoById(id)
      console.log(id)
    }
  }
}
// plants: [
//         {
//           id: '1',
//           imgsrc: 'src/assets/1515047252014黄花.jpeg',
//           imginfo: '玫瑰（学名：Rosa rugosa Thunb.）：原产地中国。属蔷薇目，蔷薇科落叶灌木，枝杆多针刺，奇数羽状复叶，小叶5-9片，椭圆形，有边刺。花瓣倒卵形，重瓣至半重瓣，花有紫红色、白色，果期8-9月，扁球形。枝条较为柔弱软垂且多密刺，每年花期只有一次，因此较少用于育种，近来其主要被重视的特性为抗病性与耐寒性。玫瑰作为经济作物时，其花朵主要用于食品及提炼香精玫瑰油，玫瑰油应用于化妆品、食品、精细化工等工业。在欧洲诸语言中，蔷薇、玫瑰、月季都是使用同一个词，如英语是rose，德语是Die Rose。玫瑰是英国的国花，也是中国吉林省吉林市的市花。通俗意义中的“玫瑰”已成为多种蔷薇属植物的通称。且事实上杂交玫瑰也是由蔷薇属下各物种杂交选育所产生。此内容请看“玫瑰花”一词。'
//         },
//         {
//           id: '2',
//           imgsrc: 'src/assets/rose.jpg',
//           imginfo: '玫瑰（学名：Rosa rugosa Thunb.）：原产地中国。属蔷薇目，蔷薇科落叶灌木，枝杆多针刺，奇数羽状复叶，小叶5-9片，椭圆形，有边刺。花瓣倒卵形，重瓣至半重瓣，花有紫红色、白色，果期8-9月，扁球形。枝条较为柔弱软垂且多密刺，每年花期只有一次，因此较少用于育种，近来其主要被重视的特性为抗病性与耐寒性。玫瑰作为经济作物时，其花朵主要用于食品及提炼香精玫瑰油，玫瑰油应用于化妆品、食品、精细化工等工业。在欧洲诸语言中，蔷薇、玫瑰、月季都是使用同一个词，如英语是rose，德语是Die Rose。玫瑰是英国的国花，也是中国吉林省吉林市的市花。通俗意义中的“玫瑰”已成为多种蔷薇属植物的通称。且事实上杂交玫瑰也是由蔷薇属下各物种杂交选育所产生。此内容请看“玫瑰花”一词。'
//         },
//         {
//           id: '3',
//           imgsrc: 'src/assets/rose.jpg',
//           imginfo: '玫瑰（学名：Rosa rugosa Thunb.）：原产地中国。属蔷薇目，蔷薇科落叶灌木，枝杆多针刺，奇数羽状复叶，小叶5-9片，椭圆形，有边刺。花瓣倒卵形，重瓣至半重瓣，花有紫红色、白色，果期8-9月，扁球形。枝条较为柔弱软垂且多密刺，每年花期只有一次，因此较少用于育种，近来其主要被重视的特性为抗病性与耐寒性。玫瑰作为经济作物时，其花朵主要用于食品及提炼香精玫瑰油，玫瑰油应用于化妆品、食品、精细化工等工业。在欧洲诸语言中，蔷薇、玫瑰、月季都是使用同一个词，如英语是rose，德语是Die Rose。玫瑰是英国的国花，也是中国吉林省吉林市的市花。通俗意义中的“玫瑰”已成为多种蔷薇属植物的通称。且事实上杂交玫瑰也是由蔷薇属下各物种杂交选育所产生。此内容请看“玫瑰花”一词。'
//         }
// ]
</script>
