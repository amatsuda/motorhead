# frozen_string_literal: true
class RoadCrew::EngineSettingsController < ActionController::Base
  include Motorhead::Controller
  layout false

  def index
    @engine_settings = JSON.parse(cookies['road_crew_engine_settings'].presence || '{}')
    all_engine_names = Rails::Engine.subclasses.select {|e| e < Motorhead::Engine}.map {|e| e.parent.name} - ['RoadCrew']
    # enable by default
    (all_engine_names - @engine_settings.keys).each {|engine_name| @engine_settings[engine_name] = '1'}
  end

  def update_all
#     on, off = engines.partition {|k, v| v == '1'}.map {|a| a.map {|kv| kv.first}}
    engine_settings = JSON.parse(cookies['road_crew_engine_settings'].presence || '{}').merge params[:engine_setting]
    cookies['road_crew_engine_settings'] = engine_settings.to_json
    redirect_to request.referer
  end
end
