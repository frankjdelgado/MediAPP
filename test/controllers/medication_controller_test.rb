require 'test_helper'

class MedicationControllerTest < ActionController::TestCase
  
  # 	#index
  #   test "should get index" do
	 #    get :index
	 #    assert_response :success
	 #    assert_not_nil assigns(:medications)
  # 	end

  # 	#show
  # 	test "should get show" do   		
  # 		get(:show, {'id' => "12"}, {'user_id' => 5})
		# 	assert_response :success
	 #    assert_not_nil assigns(:medications)
  # 	end
  
  # 	#new
  # 	test "should get new" do   		
  # 		get(:new, {'id' => "10"}, {'user_id' => 5})
		# 	assert_response :success
	 #    assert_not_nil assigns(:medications)
  # 	end

  # 	#edit
  # 	test "should get edit" do   		
  # 		get(:edit, {'id' => "12"}, {'user_id' => 5})
		# 	assert_response :success
	 #    assert_not_nil assigns(:medications)
  # 	end

   	#create
		test "should create Medication" do
		  assert_difference('Medication.count') do
		    post :create, medication: {name: 'Vicodim', description: 'pain killer'}
		  end
		 
		  assert_redirected_to medication_path(assigns(:medication))
		  assert_equal 'Medication was successfully created.', flash[:notice]
		end

		# #update
  # 	test "should get update" do   		
  # 		patch(:update, {'id' => "10"},{name:"Vicorin"} , {'user_id' => 5})
		# 	assert_response :success
	 #    assert_not_nil assigns(:medications)
	 #    assert_equal 'Medication was successfully updated.', flash[:notice]
  # 	end

  # 	#patch
  # 	test "should get patch" do   		
  # 		put(:update, {'id' => "10"}, {medication:{name:"Vicorin"} },{'user_id' => 5})
		# 	assert_response :success
	 #    assert_not_nil assigns(:medications)
	 #    assert_equal 'Medication was successfully updated.', flash[:notice]
  # 	end

  # 	#destroy
  # 	test "should destroy" do   		
  # 		delete(:destroy, {'id' => "15"}, {'user_id' => 5})
		# 	assert_response :success
	 #    assert_not_nil assigns(:medications)
	 #    assert_equal 'Medication was successfully destroyed.', flash[:notice]
  # 	end


end
