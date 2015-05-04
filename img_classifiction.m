function Res = img_classifiction(codeVector,codeVectorAll,classIDs,w,b)
 
   % if you use kNN, you may need all codebook in learning step
   % "codeVectorAll" and its class ID "classIDs"
   % For example, codeVectorAll(:,i) is i^{th} learnt code vector, and
   % classIDs(i) indicates its class.
   % if you use SVM, you need normal vector w 

    %%%%%%%%%% TO Do  %%%%%%%%%%%%%
    % The input codeVector represent an testing image. We should classify
    % this image. Using [codeVectorAll,classIDs] or [w] depends the
    % classifier you used
    % Please remove this example code and rewrite your testing code, here.
   
  	%kdtree = vl_kdtreebuild(codeVectorAll);
    %[index,~] = vl_kdtreequery(kdtree,codeVectorAll,codeVector);
    %Res = classIDs(index);
    
    result = zeros(5,1);
    
    for classID = 1 : 5
        currW = w(:,classID);
        currB = b(classID,1);
        result(classID,1) = currW' * codeVector + currB;
    end
    
    disp(result);
    
    Res = -1;
    
    for classID = 1 : 5
        if result(classID) > 0
            Res = classID;
            break;
        end
    end
    
   %%%%%%%%%% To Do  End %%%%%%%%%%
   
end