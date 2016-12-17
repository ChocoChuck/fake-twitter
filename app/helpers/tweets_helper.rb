module TweetsHelper
  def edit_tweet_link(tweet)
    link_to('Edit', edit_tweet_path(tweet), class: 'btn btn-default')
  end

  def delete_tweet_link(tweet)
    link_to('Delete',
        tweet_path(tweet),
        method: :delete,
        class: 'btn btn-default',
        data: {confirm: 'Are you sure you want to delete this tweet?'})
  end
end
