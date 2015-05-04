function image_classification_training()
  
    % The function name is corresponding to "System Outline and
    % Implementation Details" of project page. 
   
    disp('extraction computing begins......')
  
    for classID = 1 : 5   % five class.
        for imgID = 1 : 60 % training image number in each class.
            disp(['extraction: the ',num2str(imgID),' th image in class ', num2str(classID), ' is processing'])
            %feature_extraction('training', 'training', classID, imgID);
        end
    end
    
    %descriptporMatrix = descriptpor_load();
    %codebook_computation(descriptporMatrix);
   
    disp('code vector computing begins......')
    for classID = 1 : 5
        for imgID = 1 : 60
            %code_vector('training', 'training', classID, imgID);
        end
    end
   
   
    %If you don't use SVM as classifier, you can ignore svm_learning
    %function and set 'is_SVM_used = false'
    is_SVM_used = true; 
    if (is_SVM_used)
        svm_learning(); 
    end

    disp('Training phase is done!')
end 



  



























