$(document).on('turbolinks:load', function(){ //ページを読み込んだらjs発火

  var sweetness = gon.sweetness; //gonを使った変数をjsで変数に代入

  var flavor = gon.flavor;

  var sour = gon.sour;

  var feeling = gon.feeling;

  var rich = gon.rich;



  var ctx = document.getElementsByClassName("SakeChart"); //html内のcanvasタグ

  (クラスがmyChart)



  new Chart(ctx, {

  type: 'radar', //レーダーチャートを指定

  data: {

  labels: ["甘味", "香り", "酸味", "飲みやすさ", "コク"], //5角形の頂点の名前

  datasets: [{ 

  label: '味のバランス', //レーダーチャートの表すもの 

  backgroundColor: "rgba(0,0,80,0.4)", //グラフの色

  borderColor: "rgba(0,0,80,1)", //レーダーの線の色

  data: [sweetness,flavor,sour,feeling,rich] //実際に引っ張るデータの変数

  }],

  },

  options: {

  scale: {

  pointLabels: {

  fontColor: "green" //5角形の頂点の名前の色

  },

  ticks: {

  min: 0, //minimun（チャートの中心)

  max: 5, //maximum (五角形の頂点)

  stepSize: 1 //1目盛りの区切り

  }

  }

  }

  });

  });