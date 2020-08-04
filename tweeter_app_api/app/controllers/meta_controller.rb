class MetaController < ApplicationController 
def about 
render json: { content: "You've hit the metaroute!"}
end 
end 
