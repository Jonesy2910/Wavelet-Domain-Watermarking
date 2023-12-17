function [result] = embedding(image, watermark, alpha)
    img_dim = size(image,1);
    image = image(:);
    watermark = watermark(:);
    for index = 1:size(watermark)
        image(index) = image(index) + alpha * watermark(index) * image(index);
    end

    result = reshape(image,[img_dim, img_dim]);

end 