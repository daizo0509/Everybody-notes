class SearchesController < ApplicationController
  def index
  	groupings = []

     words = params[:q].delete(:name_cont) if params[:q].present?
    if words.present?
      params[:q][:groupings] = []
    
      words.split(/[ 　]/).each_with_index do |word, i| #全角空白と半角空白で切って、単語ごとに処理します
        params[:q][:groupings][i] = { name_cont: word }
      end
    end
    
    @arr = []  

    params[:q]["groupings"].count.times do |i|  #入力された分だけ繰り返す
      @arr << Tag.ransack({ name_cont: params[:q]["groupings"][i]["name_cont"] }).result #tags_nameの検索結果を空配列の@arrに入れる。
    end

    a = []

    @arr.count.times do |i|  
      @arr[i].count.times do |n|
        @arr[i][n].posts.each do |p|
          a.push(p)
        end
      end
    end

      #なんでPostsのレコードが引っ張ってこれるか？
      #[]がfind_byがかかっている状態と同じ状態で入っているのでtag_idに紐ずくpostsテーブルのデータがtaggingテーブ経由して持ってこれるようになっている。
      #[i][n]はcont検索で引っかかったタグのタグのどの階層まで拾うかを示していて今回の場合は２階層まで拾うので検索にかけたワードとcont検索に引っかかったワードを１つまで拾ってきて２つで1組になりそのセットがcont検索に引っかかった分だけ表示される仕組み。
    @posts = a.uniq
  end
end
