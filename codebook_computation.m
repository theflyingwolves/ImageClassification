function  codebook_computation(descriptorMatrix)
    disp('codebook computing begins......')
    
    % In this function, you calculate the codebook
    % the codebook is recorded using matrix "CodeBook"
    % All the descriptor is saved in "descriptporMatrix". Each column is a
    % descriptor.
        
    %%%%%%%%%% TO Do  %%%%%%%%%%%%%
    % The example code employs "random selection", which cannot get a
    % qualified codebook. It just let you know what is codebook matrix
    % Please remove this example code and rewrite your codebook computing code here.
    
    codeNum = 500;
    
    [IDX,C] = kmeans(descriptorMatrix',codeNum);
    CodeBook = C';
    
    %codeNum = 500; % you can change it by yourself.
    %CodeBook = zeros(size(descriptporMatrix,1),codeNum);
    %index = randperm(size(descriptporMatrix,2));
    %for ii = 1 : codeNum
    %    CodeBook(:,ii) = descriptporMatrix(:, index(ii)) ;
    %end
    %%%%%%%%%% To Do  End %%%%%%%%%%
   
   save('training/code_book/CodeBook.mat','CodeBook');
end



