function ssm = formskewsym(X)
ssm = [0, -1*X(3), X(2);X(3), 0, -1*X(1);-1*X(2) X(1) 0];
end