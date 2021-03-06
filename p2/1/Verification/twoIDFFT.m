function FFTResult = twoDFFT(Data)
M = size(Data, 2);
N = size(Data, 1);

colResult = zeros(N, M);
% Column operaion
for col = 1 : M
odData = Data(:, col);
colResult(:, col) = oneIDFFT(odData)./N;
end

FFTResult = zeros(N, M);
% Row operaion
for row = 1 : N
odData = colResult(row, :);
FFTResult(row, :) = oneIDFFT(odData)./M;
end
end