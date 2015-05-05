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
    
    %codeNum = 500;
    %[IDX,C] = kmeans(descriptorMatrix',codeNum);
    %CodeBook = C';
    
    codeNum = 500;
    beta = 0.4;
    batch_size = 1000;
    num_iters = 100;
    sparsity_func= 'L1';
    epsilon = [];
    fname_save = sprintf('./training/code_book/sc_%s_b%d_beta%g_%s', sparsity_func, codeNum, beta, datestr(now, 30));
    Binit = [];
    
    B = sparse_coding(descriptorMatrix, codeNum, beta, sparsity_func, epsilon, num_iters, batch_size, fname_save, Binit);
    CodeBook = double(B);
    
    disp('Size of CodeBook: (Expected 128-by-500)');
    size(CodeBook)
    
    %codeNum = 500; % you can change it by yourself.
    %CodeBook = zeros(size(descriptporMatrix,1),codeNum);
    %index = randperm(size(descriptporMatrix,2));
    %for ii = 1 : codeNum
    %    CodeBook(:,ii) = descriptporMatrix(:, index(ii)) ;
    %end
    %%%%%%%%%% To Do  End %%%%%%%%%%
   
   save('training/code_book/CodeBook.mat','CodeBook');
end



