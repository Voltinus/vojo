class ForumController < ApplicationController
  def index
    @categories = ForumCategory.all
  end
  
  def category
    @this_category = ForumCategory.find(params['category_id'])
    @subcategories = ForumSubcategory.where(forum_category_id: params['category_id'])
  end
  
  def subcategory
    @this_category = ForumCategory.find(params['category_id'])
    @this_subcategory = ForumSubcategory.find(params['subcategory_id'])
    @topics = ForumTopic.where(forum_subcategory_id: params['subcategory_id'], language: locale)
  end
  
  def topic
    @this_category = ForumCategory.find(params['category_id'])
    @this_subcategory = ForumSubcategory.find(params['subcategory_id'])
    @this_topic = ForumTopic.find(params['topic_id'])

    if params['commit']
      if params['content'] == ''
        flash.alert = t('alert.post_empty')
      else
        ForumPost.create(user_id: current_user.id, content: params['content'], forum_topic_id: @this_topic.id)
      end
    end

    @posts = ForumPost.where(forum_topic_id: params['topic_id'])
  end
end
