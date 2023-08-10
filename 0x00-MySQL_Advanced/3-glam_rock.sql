-- Lists all bands with Glam rock as their main style, ranked by their longevity.
-- SELECT band_name, (IFNULL(split, YEAR(CURRENT_DATE())) - formed) AS lifespan
SELECT band_name, 
       IF(lifespan_split IS NOT NULL AND lifespan_formed IS NOT NULL,
          lifespan_split - lifespan_formed,
          IF(lifespan_formed IS NOT NULL, 
             2022 - lifespan_formed,
             IF(lifespan_split IS NOT NULL,
                lifespan_split,
                0
             )
          )
       ) AS lifespan
FROM metal_bands
WHERE main_style = 'Glam rock'
ORDER BY lifespan DESC;