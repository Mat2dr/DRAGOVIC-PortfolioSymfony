<?php

namespace App\Entity;

use App\Repository\CVRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CVRepository::class)
 */
class CV
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Texte;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTexte(): ?string
    {
        return $this->Texte;
    }

    public function setTexte(string $Texte): self
    {
        $this->Texte = $Texte;

        return $this;
    }

}
