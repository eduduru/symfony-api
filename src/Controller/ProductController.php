<?php

// src/Controller/ProductController.php
namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

use Symfony\Component\Serializer\Annotation\Groups;


class ProductController extends AbstractController
{
    private $entityManager;
    private $productRepository;
    private $validator;

    public function __construct(EntityManagerInterface $entityManager, ProductRepository $productRepository, ValidatorInterface $validator)
    {
        $this->entityManager = $entityManager;
        $this->productRepository = $productRepository;
        $this->validator = $validator;
    }

    /**
     * @Route("/api/products", name="product_list", methods={"GET"})
     */
    public function index(): JsonResponse
    {
        $products = $this->productRepository->findAll();
        // dump($products);

        return $this->json($products);
       
    }

    // public function index(ProductRepository $productRepository, SerializerInterface $serializer): Response
    // {
    //     $products = $productRepository->findAll();
    //     return $this->json($products , 200, ['Content-Type' => 'application/json']);
     
    // }

    /**
     * @Route("/api/products", name="product_create", methods={"POST"})
     */
    public function create(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $product = new Product();
        $product->setName($data['name']);
        $product->setDescription($data['description'] ?? null);
        $product->setPrice($data['price']);

        // Validate the entity
        $errors = $this->validator->validate($product);
        if (count($errors) > 0) {
            return $this->json(['errors' => (string) $errors], JsonResponse::HTTP_BAD_REQUEST);
        }

        // Persist the entity
        $this->entityManager->persist($product);
        $this->entityManager->flush();

        return $this->json(['message' => 'Product created successfully'], JsonResponse::HTTP_CREATED);
    }

    /**
     * @Route("/api/products/{id}", name="product_show", methods={"GET"})
     */
   
    public function show(int $id): JsonResponse
    {
       $product = $this->productRepository->find($id);

        // $product = $this->entityManager->getRepository(Product::class)->find($id);

        // dump($product);
        if (!$product) {
            return $this->json(['message' => 'Product not found'], JsonResponse::HTTP_NOT_FOUND);
        }

        $data = [
            'id' => $product->getId(),
            'name' => $product->getName(),
            'description' => $product->getDescription(),
            'price' => $product->getPrice(),
        ];
        // return new JsonResponse($data);

        return $this->json($data);

        // Serialize the product into JSON response
        // return $this->json($product);
    }

    public function update(Request $request, $id): Response
    {
        // Handle product update
        dd($request);
    }

    // public function update(Request $request, int $id): JsonResponse
    // {
    //     $data = json_decode($request->getContent(), true);

    //     // Find the product by ID
    //     $product = $this->productRepository->find($id);

    //     if (!$product) {
    //         return $this->json(['message' => 'Product not found'], JsonResponse::HTTP_NOT_FOUND);
    //     }

    //     // Update product properties
    //     $product->setName($data['name'] ?? $product->getName());
    //     $product->setDescription($data['description'] ?? $product->getDescription());
    //     $product->setPrice($data['price'] ?? $product->getPrice());

    //     // Validate the entity
    //     $errors = $this->validator->validate($product);
    //     if (count($errors) > 0) {
    //         return $this->json(['errors' => (string) $errors], JsonResponse::HTTP_BAD_REQUEST);
    //     }

    //     // Persist the updated entity
    //     $this->entityManager->flush();

    //     return $this->json(['message' => 'Product updated successfully']);
    // }

    /**
     * @Route("/api/products/{id}", name="product_delete", methods={"DELETE"})
     */

    public function delete($id): Response
    {
        $product = $this->productRepository->find($id);

        if (!$product) {
            // throw $this->createNotFoundException('The product does not exist');
            return $this->json(['message' => 'Product not found'], JsonResponse::HTTP_NOT_FOUND);
        }

        $this->entityManager->remove($product);
        $this->entityManager->flush();

        return $this->json(['message' => 'Product deleted successfully']);
    }
}

