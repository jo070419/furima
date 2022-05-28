document.addEventListener("DOMContentLoaded", () => {
const tagNameInput = document.querySelector("#item_form_tag_name");
  if (tagNameInput){
    const inputElement = document.getElementById("item_form_tag_name");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("item_form_tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/items/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        // 検索候補表示の欄を取得
        const searchResult = document.getElementById("search-result");
        // 取得した候補表示の欄を空にする
        searchResult.innerHTML = "";
        if (XHR.response) {
          // tagNameにデータベースにタグ存在するタグの名前を代入
          const tagName = XHR.response.keyword;
          // タグの数だけ以下を繰り返し処理
          tagName.forEach((tag) => {
            // 候補のタグを表示させるためのエリアを生成
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            // childElement(候補のタグを表示させるためのエリア)にtag_nameを挿入
            childElement.innerHTML = tag.tag_name;
            // appendChildで親要素(searchResult)に子要素(childElement)を追加
            searchResult.appendChild(childElement);
            // 表示されているタグのエリアをclickElementに代入
            const clickElement = document.getElementById(tag.id);
            // clickElementがクリックされたら以下の記述を実行
            clickElement.addEventListener("click", () => {
              // タグ入力欄の値に表示されているタグのテキストを代入
              document.getElementById("item_form_tag_name").value = clickElement.textContent;
              // 表示されているタグを取り除く
              clickElement.remove();
            });
          });
        };
      };
    });
  };
});