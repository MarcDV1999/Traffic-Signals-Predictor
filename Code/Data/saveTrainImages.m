function [images, names] = saveTrainImages()
interval = 10;
size = floor(39209/interval);
images = cell(1,size);
names = cell(1, size);
count = 1;
index = 1;
for i = 0:42
        if i <= 17
            folder = sprintf('../Images/Train1/%d/', i);
        else
            folder = sprintf('../Images/Train2/%d/', i);
        end
        
        filesAndFolders = dir(folder);
        for j = 1:numel(filesAndFolders)
            if ~filesAndFolders(j).isdir && filesAndFolders(j).name ~= ".DS_Store"
                %disp(filesAndFolders(j).name) % disp displays the value of the input variable
                if mod(count, interval) == 0 
                    fullname = sprintf("%s%s", folder, filesAndFolders(j).name);
                    images{index} = imread(fullname);
                    names{index} = fullname;
                    index = index + 1;
                end
                count = count + 1;
            end
        end
end
end